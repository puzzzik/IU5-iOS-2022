//
//  Lab5CollectionRouter.swift
//  LABS
//
//  Created by Иван Тазенков on 30.03.2022.
//

import Foundation
import UIKit

final class Lab5CollectionRouter {
	weak var viewController: Lab5CollectionViewController?

	init(viewController: Lab5CollectionViewController) {
		self.viewController = viewController
	}
}

extension Lab5CollectionRouter: Lab5CollectionRouterInput {
	func showDatePicker() {
		let viewController = Lab5DateViewController()
		self.viewController?.present(viewController, animated: true)
	}
}
