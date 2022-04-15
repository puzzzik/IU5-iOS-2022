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
}

// MARK: - LocationManager

final class LocationManager: LocationManagerProtocol {
    // MARK: Private

    private let locationManager: CLLocationManager

    // MARK: Lifecycle

    init() {
        locationManager = CLLocationManager()
    }

    // MARK: Internal

    func requestAuthorization() {
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.requestLocation()
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
}
