//
//  Lab5CollectionRouter.swift
//  LABS
//
//  Created by Иван Тазенков on 30.03.2022.
//

import Foundation
import UIKit

final class Lab5CollectionRouter {
	weak var presenter: Lab5CollectionPresenterIO?
	weak var viewController: UIViewController?
}

extension Lab5CollectionRouter: Lab5CollectionRouterIO {
	
	func showDatePicker() {
		let viewController = Lab5DateViewController()
		self.viewController?.present(viewController, animated: true)
	}
}
