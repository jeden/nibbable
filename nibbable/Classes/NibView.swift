//
//  NibView.swift
//  Nibbable
//
//  Created by Antonio Bello on 1/26/17.
//  Copyright © 2017 Antonio Bello. All rights reserved.
//

import UIKit

public protocol DelegableView {
	associatedtype ViewDelegate
	var viewDelegate: ViewDelegate? { get set }
}

open class NibView : UIView {
	private var rawViewProcessed = false

	override open func prepareForInterfaceBuilder() {
		addSubview(instanceFromNib())
	}

	override open func awakeAfter(using aDecoder: NSCoder) -> Any? {
		guard isRawView() && self.rawViewProcessed == false else { return self }
		self.rawViewProcessed = true

		for view in self.subviews {
			view.removeFromSuperview()
		}

		let view = instanceFromNib()

        view.translatesAutoresizingMaskIntoConstraints = self.translatesAutoresizingMaskIntoConstraints
        
		// Transfer the new view to the superview
		let superview = self.superview
		removeFromSuperview()
		superview?.addSubview(view)

		// Copy constraints over
		let constraints: [NSLayoutConstraint] = self.constraints.map { constraint in
            constraint.isActive = false
            let firstView, secondView: AnyObject?
            if let constrainedView = constraint.firstItem as? UIView, constrainedView === self {
                firstView = view
            } else {
                firstView = constraint.firstItem
            }

            if let constrainedView = constraint.secondItem as? UIView, constrainedView === self {
                secondView = view
            } else {
                secondView = constraint.secondItem
            }

            let newConstraint = NSLayoutConstraint(
                item: firstView as Any,
                attribute: constraint.firstAttribute,
                relatedBy: constraint.relation,
                toItem: secondView,
				attribute: constraint.secondAttribute,
                multiplier: constraint.multiplier,
                constant: constraint.constant
            )

			return newConstraint
        }
        view.addConstraints(constraints)

		return view
	}
}

private typealias Internals = NibView
private extension Internals {
	func isRawView() -> Bool {
		// A subview created by code (as opposed to  being deserialized from a nib
		// has 2 subviews, both implementing the UILayerSupport protocol
		return
			self.subviews.count == 0 || (
				self.subviews.count == 2 &&
				self.subviews.compactMap({ $0.conforms(to: UILayoutSupport.self) ? $0 : nil }).count == 2
			)
	}

	func instanceFromNib() -> UIView {
		return instanceFromNib(at: 0)
	}

	func instanceFromNib(at index: Int) -> UIView {
		let viewType = type(of: self)
		let className = NSStringFromClass(viewType).components(separatedBy: ".").last!
		let bundle = Bundle(for: viewType)
		let nib = UINib(nibName: className, bundle: bundle)
		let view: UIView = nib.instantiate(withOwner: self, options: nil)[index] as! UIView
		return view
	}
}
