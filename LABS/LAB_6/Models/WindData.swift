//
//  WindData.swift
//  LABS
//
//  Created by Иван Тазенков on 03.04.2022.
//

import Foundation
struct WindData: Decodable {
	let speed: Double
	let degree: Double

	enum CodingKeys: String, CodingKey {
		case speed
		case degree = "deg"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)

		speed = try values.decode(Double.self, forKey: .speed)
		degree = try values.decode(Double.self, forKey: .degree)
	}
}
