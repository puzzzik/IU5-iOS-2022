//
//  WeatherSystemData.swift
//  LABS
//
//  Created by Иван Тазенков on 03.04.2022.
//

import Foundation
struct WeatherSystemData: Decodable {
	let country: String
	let sunset: Date
	let sunrise: Date

	enum CodingKeys: String, CodingKey {
		case country
		case sunset
		case sunrise
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)

		country = try values.decode(String.self, forKey: .country)
		sunset = try values.decode(Date.self, forKey: .sunset)
		sunrise = try values.decode(Date.self, forKey: .sunrise)
	}

    init(country: String, sunset: Date, sunrise: Date) {
        self.sunset = sunset
        self.sunrise = sunrise
        self.country = country
    }
}
