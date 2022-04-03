//
//  WeatherInteractorIO.swift
//  LABS
//
//  Created by Иван Тазенков on 03.04.2022.
//

import Foundation
protocol WeatherInteractorInput: AnyObject {
	func setCityName(cityName: String)
}

protocol WeatherInteractorOutput: AnyObject {
	func setWeatherForecast(forecast: WeatherForecast)
}
