//
//  NetworkRequestFactory.swift
//  LABS
//
//  Created by Иван Тазенков on 02.04.2022.
//

import Foundation

protocol NetworkRequestFactoryProtocol: AnyObject {
	func getWeatherRequestForCurrentLocation(cityName: String) -> URLRequest
}

final class NetworkRequestFactory: NetworkRequestFactoryProtocol {
	private enum Constants {
		static let apiKey = "0d6eb8362cfe0622d5bc1b40279fb037"
		static let baseURL = URL(string: "https://api.openweathermap.org/data/2.5")!
		static let units = "metric"
		static let language = "ru"
	}

	func getWeatherRequestForCurrentLocation(cityName: String) -> URLRequest {
		let requestURL = Constants.baseURL.appendingPathComponent("weather")
		var urlComponents = URLComponents(url: requestURL, resolvingAgainstBaseURL: false)
		urlComponents?.queryItems = [
			URLQueryItem(name: "q", value: cityName),
			URLQueryItem(name: "units", value: Constants.units),
			URLQueryItem(name: "lang", value: Constants.language),
			URLQueryItem(name: "appid", value: Constants.apiKey)
		]
		guard let url = urlComponents?.url else {
			assertionFailure("Something has gone wrong and URL could not be constructed!")
			return URLRequest(url: URL(string: "")!)
		}
		return URLRequest(url: url)
	}
}
