//
//  WeatherSystemDataModel+Converter.swift
//  LABS
//
//  Created by Иван Тазенков on 09.04.2022.
//

import CoreData
extension WeatherSystemDataModel {
    static func convert(dto: WeatherSystemData, into context: NSManagedObjectContext) -> WeatherSystemDataModel {
        let model = WeatherSystemDataModel(context: context)
        model.country = dto.country
        model.sunrise = dto.sunrise
        model.sunset = dto.sunset

        return model
    }

    func convertToDTO() -> WeatherSystemData {
        return WeatherSystemData(country: country ?? "",
                                 sunset: sunset ?? Date(),
                                 sunrise: sunrise ?? Date())
    }
}
