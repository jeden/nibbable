//
//  LifecycleableView.swift
//  Nibbable
//
//  Created by Antonio Bello on 1/26/17.
//  Copyright © 2017 Antonio Bello. All rights reserved.
//

import UIKit

public protocol LifecycleableView : class {
	func setupView()

	func viewDidLoad()

	func viewWillAppear()
	func viewDidAppear()

	func viewWillDisappear()
	func viewDidDisappear()
}

extension UIView : LifecycleableView {
	public func setupView() { }

	@objc open dynamic func viewDidLoad() {
		setupView()
		for view in self.lifecycleableViews {
			view.viewDidLoad()
		}
	}

	@objc open dynamic func viewWillAppear() {
		for view in self.lifecycleableViews {
			view.viewWillAppear()
		}
	}

	@objc open dynamic func viewDidAppear() {
		for view in self.lifecycleableViews {
			view.viewDidAppear()
		}
	}

	@objc open dynamic func viewWillDisappear() {
		for view in self.lifecycleableViews {
			view.viewWillDisappear()
		}
	}
	@objc open dynamic func viewDidDisappear() {
		for view in self.lifecycleableViews {
			view.viewDidDisappear()
		}
	}

	private var lifecycleableViews: [LifecycleableView] {
		return self.subviews.flatMap { $0 as LifecycleableView }
	}
}

