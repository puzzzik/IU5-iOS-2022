//
//  WeatherDataModel.swift
//  LABS
//
//  Created by Иван Тазенков on 09.04.2022.
//

import CoreData

extension WeatherDataModel {
    static func convert(dto: WeatherData, into context: NSManagedObjectContext) -> WeatherDataModel {
        let model = WeatherDataModel(context: context)

        model.main = dto.main
        model.weatherDescription = dto.description

        return model
    }

    func convertToDTO() -> WeatherData {
        WeatherData(main: main ?? "",
                    description: weatherDescription ?? "")
    }

}
