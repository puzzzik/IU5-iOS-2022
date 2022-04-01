//
//  Lab5CollectionBuilder.swift
//  LABS
//
//  Created by Иван Тазенков on 30.03.2022.
//

import Foundation
import UIKit

final class Lab5CollectionBuilder {
	func build() -> UIViewController {
		let view = Lab5CollectionViewController()
		let interactor = Lab5CollectionInteractor()
		let presenter = Lab5CollectionPresenter(interactor: interactor)
		let router = Lab5CollectionRouter(viewController: view)

		view.output = presenter
		presenter.view = view
		presenter.router = router
		interactor.output = presenter

		return view
	}
}
