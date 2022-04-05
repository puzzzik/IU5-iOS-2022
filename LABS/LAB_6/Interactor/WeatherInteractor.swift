//
//  WeatherInteractor.swift
//  LABS
//
//  Created by Иван Тазенков on 03.04.2022.
//

import Foundation

// MARK: - WeatherInteractor

final class WeatherInteractor {
    weak var output: WeatherInteractorOutput!

    var requestFactory: NetworkRequestFactoryProtocol!
    var networkService: NetworkServiceProtocol!

    var cityName: String = ""

    init(requestFactory: NetworkRequestFactoryProtocol, networkService: NetworkServiceProtocol) {
        self.requestFactory = requestFactory
        self.networkService = networkService
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(getWeather),
                                               name: NSNotification.Name("userDidTypedCityName"),
                                               object: nil)
    }

    @objc private func getWeather() {
        let request = requestFactory.getWeatherRequestForCurrentLocation(cityName: cityName)
        networkService.sendRequest(request) { [weak self] result in
            switch result {
            case .failure(let error):
                print("Error: \(error)")

            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let forecast = try decoder.decode(WeatherForecast.self, from: data)
                    self?.output.setWeatherForecast(forecast: forecast)
                } catch {
                    assertionFailure("\(error)")
                }
            }
        }
    }
}

// MARK: WeatherInteractorInput

extension WeatherInteractor: WeatherInteractorInput {
    func setCityName(cityName: String) {
        self.cityName = cityName
    }
}
