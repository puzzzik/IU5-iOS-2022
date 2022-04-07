//
//  NetworkRequestFactory.swift
//  LABS
//
//  Created by Иван Тазенков on 02.04.2022.
//

import Foundation
import CoreLocation

// MARK: - NetworkRequestFactoryProtocol

protocol NetworkRequestFactoryProtocol: AnyObject {
    func getWeatherRequestForCurrentLocation() -> URLRequest
    func getWeatherRequestForCity(cityName: String) -> URLRequest
}

// MARK: - NetworkRequestFactory

final class NetworkRequestFactory: NetworkRequestFactoryProtocol {
    // MARK: Lifecycle

    init(locationManager: LocationManagerProtocol) {
        self.locationManager = locationManager
    }

    // MARK: Internal

    func getWeatherRequestForCurrentLocation() -> URLRequest {
        let location = locationManager.getCurrentLocation()
        let requestURL = Constants.baseURL.appendingPathComponent("weather")
        var urlComponents = URLComponents(url: requestURL, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = [
            URLQueryItem(name: "lat", value: "\(location.coordinate.latitude)"),
            URLQueryItem(name: "lon", value: "\(location.coordinate.longitude)"),
            URLQueryItem(name: "appid", value: Constants.apiKey),
        ]
        guard let url = urlComponents?.url else {
            assertionFailure("Something has gone wrong and URL could not be constructed!")
            return URLRequest(url: URL(string: "")!)
        }
        return URLRequest(url: url)
    }

    func getWeatherRequestForCity(cityName: String) -> URLRequest {
        let requestURL = Constants.baseURL.appendingPathComponent("weather")
        var urlComponents = URLComponents(url: requestURL, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = [
            URLQueryItem(name: "q", value: cityName),
            URLQueryItem(name: "units", value: Constants.units),
            URLQueryItem(name: "lang", value: Constants.language),
            URLQueryItem(name: "appid", value: Constants.apiKey),
        ]
        guard let url = urlComponents?.url else {
            assertionFailure("Something has gone wrong and URL could not be constructed!")
            return URLRequest(url: URL(string: "")!)
        }
        return URLRequest(url: url)
    }

    // MARK: Private

    private enum Constants {
        static let apiKey = "0d6eb8362cfe0622d5bc1b40279fb037"
        static let baseURL = URL(string: "https://api.openweathermap.org/data/2.5")!
        static let units = "metric"
        static let language = "ru"
    }

    private let locationManager: LocationManagerProtocol
}
