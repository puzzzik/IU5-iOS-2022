//
//  WeatherInteractorIO.swift
//  LABS
//
//  Created by Иван Тазенков on 03.04.2022.
//

import Foundation

// MARK: - WeatherInteractorInput

protocol WeatherInteractorInput: AnyObject {
	func setCityName(cityName: String)
}

// MARK: - WeatherInteractorOutput

protocol WeatherInteractorOutput: AnyObject {
	func setWeatherForecast(forecast: WeatherForecast)
}
