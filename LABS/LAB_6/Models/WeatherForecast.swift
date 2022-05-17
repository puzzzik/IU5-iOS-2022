//
//  WeatherForecast.swift
//  LABS
//
//  Created by Иван Тазенков on 03.04.2022.
//

import Foundation
struct WeatherForecast: Decodable {
	let weatherMain: WeatherMain
	let windData: WindData
	let system: WeatherSystemData
	let data: [WeatherData]
	let visibility: Double
	let cityName: String

	enum CodingKeys: String, CodingKey {
		case weatherMain = "main"
		case windData = "wind"
		case system = "sys"
		case data = "weather"
		case visibility
		case cityName = "name"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)

		weatherMain = try values.decode(WeatherMain.self, forKey: .weatherMain)
		windData = try values.decode(WindData.self, forKey: .windData)
		system = try values.decode(WeatherSystemData.self, forKey: .system)
		data = try values.decode([WeatherData].self, forKey: .data)
		visibility = try values.decode(Double.self, forKey: .visibility)
		cityName = try values.decode(String.self, forKey: .cityName)
	}
}
