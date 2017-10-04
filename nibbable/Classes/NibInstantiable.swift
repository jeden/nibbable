//
//  NibInstantiable.swift
//  Nibbable
//
//  Created by Antonio Bello on 1/26/17.
//  Copyright © 2017 Antonio Bello. All rights reserved.
//

import UIKit

public protocol NibInstantiable : class {
	static func instanceFromNib() -> Self
	static func instanceFromNib(at index: Int) -> Self
}

extension NibInstantiable where Self : UIView {
    public static func nib() -> UINib {
        let className = NSStringFromClass(Self.self).components(separatedBy: ".").last!
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: className, bundle: bundle)
        return nib
    }
    
	public static func instanceFromNib() -> Self {
		return instanceFromNib(at: 0)
	}

	public static func instanceFromNib(at index: Int) -> Self {
		let nib = Self.nib()
		let view: Self = nib.instantiate(withOwner: nil, options: nil)[index] as! Self
		return view
	}
}
