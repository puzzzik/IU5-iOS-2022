//
//  WeatherInteractor.swift
//  LABS
//
//  Created by Иван Тазенков on 03.04.2022.
//

import Foundation

// MARK: - WeatherInteractor

final class WeatherInteractor {
    // MARK: Lifecycle

    init(requestFactory: NetworkRequestFactoryProtocol, networkService: NetworkServiceProtocol) {
        self.requestFactory = requestFactory
        self.networkService = networkService
    }

    // MARK: Internal

    weak var output: WeatherInteractorOutput!

    // MARK: Private

    private let requestFactory: NetworkRequestFactoryProtocol!
    private let networkService: NetworkServiceProtocol!
}

// MARK: WeatherInteractorInput

extension WeatherInteractor: WeatherInteractorInput {
    func loadData() {
        let request = requestFactory.getWeatherRequestForCurrentLocation()
        networkService.sendRequest(request) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case let .failure(error):
                assertionFailure("Error: \(error)")

            case let .success(data):
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let forecast = try decoder.decode(WeatherForecast.self, from: data)
                    strongSelf.output.setWeatherForecast(forecast: forecast)
                } catch {
                    assertionFailure("Error: \(error)")
                }
            }
        }
    }

    func loadDataForCity(cityName: String) {
        let request = requestFactory.getWeatherRequestForCity(cityName: cityName)
        networkService.sendRequest(request) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case let .failure(error):
                assertionFailure("Error: \(error)")

            case let .success(data):
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let forecast = try decoder.decode(WeatherForecast.self, from: data)
                    strongSelf.output.setWeatherForecast(forecast: forecast)
                } catch {
                    assertionFailure("Error: \(error)")
                }
            }
        }
    }
}
