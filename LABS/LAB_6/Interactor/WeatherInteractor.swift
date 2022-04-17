//
//  WeatherInteractor.swift
//  LABS
//
//  Created by Иван Тазенков on 03.04.2022.
//

import Foundation

// MARK: - WeatherInteractor

final class WeatherInteractor {
    // MARK: Private Properties

    private let requestFactory: NetworkRequestFactoryProtocol!
    private let networkService: NetworkServiceProtocol!
    private let storage: StorageProtocol

    // MARK: Internal Properties

    weak var output: WeatherInteractorOutput!

    // MARK: Lifecycle

    init(requestFactory: NetworkRequestFactoryProtocol, networkService: NetworkServiceProtocol, storage: StorageProtocol) {
        self.requestFactory = requestFactory
        self.networkService = networkService
        self.storage = storage
    }

    // MARK: Internal

    func saveForecast(_ forecast: WeatherForecast) {
        storage.save(forecast: forecast) { result in
            switch result {
            case let .failure(error):
                print("Failed to save forecast to cache \(error)")
            case .success:
                break
            }
        }
    }

    func obtainForecastFromCache(withCityName cityName: String?, completion: @escaping (Result<WeatherForecast, Error>) -> Void) {
        storage.obtainForecast(withCityName: cityName, completion: completion)
    }

    func obtainForecastDataFromServer(withCityName cityName: String?) {
        let request: URLRequest
        if let cityName = cityName {
            request = requestFactory.getWeatherRequestForCity(cityName: cityName)
        } else {
            request = requestFactory.getWeatherRequestForCurrentLocation()
        }

        networkService.sendRequest(request) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case let .failure(error):
                assertionFailure("Failed loading data from API: \(error)")

            case let .success(data):
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let forecast = try decoder.decode(WeatherForecast.self, from: data)
                    strongSelf.saveForecast(forecast)
                    strongSelf.output.setWeatherForecast(forecast: forecast)
                } catch {
                    assertionFailure("Failed decoding data to WeatherForecast class: \(error)")
                }
            }
        }
    }
}

// MARK: WeatherInteractorInput

extension WeatherInteractor: WeatherInteractorInput {
    func loadData(cityName: String?) {
        obtainForecastFromCache(withCityName: cityName) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case let .failure(error):
                strongSelf.output.didReceiveError(error)
            case let .success(forecast):
                strongSelf.output.setWeatherForecast(forecast: forecast)
            }
        }
        obtainForecastDataFromServer(withCityName: cityName)
    }
}
