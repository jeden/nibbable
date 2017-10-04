//
//  NibVIewController.swift
//  Nibbable
//
//  Created by Antonio Bello on 1/26/17.
//  Copyright © 2017 Antonio Bello. All rights reserved.
//

import UIKit

open class NibViewController : UIViewController {
    private var mainView: LifecycleableView { return self.view as LifecycleableView }

	override open func viewDidLoad() {
		super.viewDidLoad()
		self.mainView.viewDidLoad()
	}

	override open func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.mainView.viewWillAppear()
	}

	override open func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		self.mainView.viewDidAppear()
	}

	override open func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		self.mainView.viewWillDisappear()
	}

	override open func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		self.mainView.viewDidDisappear()
	}
}
