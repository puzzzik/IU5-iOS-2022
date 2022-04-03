//
//  WeatherBuilder.swift
//  LABS
//
//  Created by Иван Тазенков on 02.04.2022.
//

import Foundation
import UIKit

class WeatherBuilder {
	func build() -> UIViewController {
		let view = WeatherViewController()
		
		let requestFactory = NetworkRequestFactory()
		let networkService = NetworkService(session: URLSession(configuration: .default))
		
		let interactor = WeatherInteractor(requestFactory: requestFactory,
		                                   networkService: networkService)
		let presenter = WeatherPresenter(interactor: interactor)
		
		view.output = presenter
		presenter.view = view
		interactor.output = presenter
		
		return view
	}
}
