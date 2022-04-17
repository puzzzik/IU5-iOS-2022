//
//  LocationManager.swift
//  LABS
//
//  Created by Иван Тазенков on 07.04.2022.
//

import Foundation
import CoreLocation

// MARK: - LocationManagerProtocol

protocol LocationManagerProtocol {
    func requestAuthorization()
    func getCurrentLocation() -> CLLocation
    func getCurrentCityName(completion: @escaping (String) -> Void)
}

// MARK: - LocationManager

final class LocationManager: LocationManagerProtocol {
    // MARK: Private

    private let locationManager: CLLocationManager
    private var cityName = ""

    // MARK: Lifecycle

    init() {
        locationManager = CLLocationManager()
    }

    // MARK: Internal

    func requestAuthorization() {
        locationManager.showsBackgroundLocationIndicator = true
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func getCurrentLocation() -> CLLocation {
        guard let location = locationManager.location else {
            assertionFailure("Couldn't get location!")
            return CLLocation(latitude: 0, longitude: 0)
        }
        return location
    }

    func getCurrentCityName(completion: @escaping (String) -> Void) {
        let location = getCurrentLocation()
        let geoCoder = CLGeocoder()

        geoCoder.reverseGeocodeLocation(location) { placemarks, error in
            if let error = error {
                assertionFailure("Failed to get current city name \(error)")
                return
            }
            guard let placemarks = placemarks else { return }

            completion(placemarks.first?.locality ?? "Москва")
        }
    }
}
