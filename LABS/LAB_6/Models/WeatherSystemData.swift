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
        let sunsetDate = try values.decode(TimeInterval.self, forKey: .sunset)
        sunset = Date(timeIntervalSince1970: sunsetDate)
        let sunriseDate = try values.decode(TimeInterval.self, forKey: .sunrise)
        sunrise = Date(timeIntervalSince1970: sunriseDate)
    }

    init(country: String, sunset: Date, sunrise: Date) {
        self.country = country
        self.sunset = sunset
        self.sunrise = sunrise
    }
}
