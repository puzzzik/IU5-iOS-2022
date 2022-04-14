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
        let locationManager = LocationManager()
        locationManager.requestAuthorization()
        let networkService = NetworkService(session: URLSession(configuration: .default))

        let requestFactory = NetworkRequestFactory(locationManager: locationManager)

        let interactor = WeatherInteractor(requestFactory: requestFactory,
                                           networkService: networkService)
        let weatherDisplayDataFactory = WeatherDisplayDataFactory()
        let presenter = WeatherPresenter(interactor: interactor, weatherDataDisplayFactory: weatherDisplayDataFactory)

        view.output = presenter
        presenter.view = view
        interactor.output = presenter

        return view
    }
}
