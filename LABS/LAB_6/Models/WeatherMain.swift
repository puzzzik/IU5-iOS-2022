//
//  WeatherMain.swift
//  LABS
//
//  Created by Иван Тазенков on 03.04.2022.
//

import Foundation
struct WeatherMain: Decodable {
	let humidity: Double
	let feelsLike: Double
	let tempMin: Double
	let tempMax: Double
	let temp: Double
	let pressure: Double
}
