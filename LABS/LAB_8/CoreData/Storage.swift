//
//  Storage.swift
//  LABS
//
//  Created by Иван Тазенков on 16.04.2022.
//

import Foundation
import CoreData

// MARK: - StorageError

enum StorageError: Error {
    case noData
}

// MARK: - StorageProtocol

protocol StorageProtocol {
    func save(forecast: WeatherForecast, completion: @escaping (Result<WeatherForecast, Error>) -> Void)
    func obtainForecast(withCityName cityName: String?, completion: @escaping (Result<WeatherForecast, Error>) -> Void)
}

// MARK: - Storage

final class Storage: StorageProtocol {
    // MARK: Private Properties

    private let coreDataManager: CoreDataManagerProtocol
    private let fetchRequestFactory: FetchRequestFactoryProtocol

    // MARK: Lifecycle

    init(coreDataManager: CoreDataManagerProtocol, fetchRequestFactory: FetchRequestFactoryProtocol) {
        self.coreDataManager = coreDataManager
        self.fetchRequestFactory = fetchRequestFactory
    }

    // MARK: Internal

    func save(forecast: WeatherForecast, completion: @escaping (Result<WeatherForecast, Error>) -> Void) {
        let context = coreDataManager.writeContext
        _ = WeatherForecastModel.convert(dto: forecast, into: context)
        do {
            try context.save()
            completion(.success(forecast))
        } catch {
            context.rollback()
            completion(.failure(error))
            assertionFailure("Failed to save data into context \(error)")
        }
    }

    func obtainForecast(withCityName cityName: String?, completion: @escaping (Result<WeatherForecast, Error>) -> Void) {
        let context = coreDataManager.readContext

        let request: NSFetchRequest<WeatherForecastModel>
        if let cityName = cityName {
            request = fetchRequestFactory.forecastRequestForCity(withCityName: cityName)
        } else {
            request = fetchRequestFactory.forecastRequestForCurrentLocation()
        }

        context.perform {
            do {
                let fetchRequestResults = try context.fetch(request)
                guard let forecast = fetchRequestResults.first else {
                    completion(.failure(StorageError.noData))
                    return
                }
                let dtoModel = forecast.convertToDTO()
                completion(.success(dtoModel))
            } catch {
                completion(.failure(error))
                assertionFailure("Failed to obtain forecast from cache \(error)")
            }
        }
    }
}
