//
//  Lab5StuffViewBuilder.swift
//  LABS
//
//  Created by Иван Тазенков on 30.03.2022.
//

import Foundation
import UIKit

final class Lab5StuffBuilder {
	func build() -> UIViewController {
		let viewController = Lab5StuffViewController()
		let presenter = Lab5StuffPresenter()

		viewController.output = presenter
		presenter.view = viewController

		return viewController
	}
}
