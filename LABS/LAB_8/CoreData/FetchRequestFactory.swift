//
//  FetchRequestFactory.swift
//  LABS
//
//  Created by Иван Тазенков on 16.04.2022.
//

import Foundation
import CoreData

// MARK: - FetchRequestFactoryProtocol

protocol FetchRequestFactoryProtocol {
    func forecastRequestForCurrentLocation() -> NSFetchRequest<WeatherForecastModel>
    func forecastRequestForCity(withCityName cityName: String) -> NSFetchRequest<WeatherForecastModel>
}

// MARK: - FetchRequestFactory

final class FetchRequestFactory: FetchRequestFactoryProtocol {
    // MARK: Private properties

    private let locationManager: LocationManagerProtocol

    // MARK: Lifecycle

    init(locationManager: LocationManagerProtocol) {
        self.locationManager = locationManager
    }

    // MARK: Internal

    func forecastRequestForCurrentLocation() -> NSFetchRequest<WeatherForecastModel> {
        let request = WeatherForecastModel.fetchRequest()
        locationManager.getCurrentCityName { cityName in
            request.predicate = NSPredicate(format: "%K == %@", #keyPath(WeatherForecastModel.cityName), cityName)
        }
        
        let dateSortDescriptor = NSSortDescriptor(key: #keyPath(WeatherForecastModel.system.sunrise),
                                                  ascending: true)
        request.sortDescriptors = [dateSortDescriptor]

        return request
    }

    func forecastRequestForCity(withCityName cityName: String) -> NSFetchRequest<WeatherForecastModel> {
        let request = WeatherForecastModel.fetchRequest()
        request.predicate = NSPredicate(format: "%K == %@", #keyPath(WeatherForecastModel.cityName), cityName)

        let dateSortDescriptor = NSSortDescriptor(key: #keyPath(WeatherForecastModel.system.sunrise),
                                                  ascending: true)
        request.sortDescriptors = [dateSortDescriptor]
        return request
    }
}
