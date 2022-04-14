//
//  WeatherMainModel+Converter.swift
//  LABS
//
//  Created by Иван Тазенков on 09.04.2022.
//

import CoreData

extension WeatherMainModel {
    static func convert(dto: WeatherMain, into context: NSManagedObjectContext) -> WeatherMainModel {
        let model = WeatherMainModel(context: context)
        model.humidity = dto.humidity
        model.feelsLike = dto.feelsLike
        model.tempMin = dto.tempMin
        model.tempMax = dto.tempMax
        model.temp = dto.temp
        model.pressure = dto.pressure

        return model
    }

    func convertToDTO() -> WeatherMain {
        WeatherMain(humidity: humidity,
                    feelsLike: feelsLike,
                    tempMin: tempMin,
                    tempMax: tempMax,
                    temp: temp,
                    pressure: pressure)
    }
}
