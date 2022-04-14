//
//  WeatherForecastModel+Converter.swift
//  LABS
//
//  Created by Иван Тазенков on 09.04.2022.
//

import CoreData

extension WeatherForecastModel {
    static func convert(dto: WeatherForecast, into context: NSManagedObjectContext) -> WeatherForecastModel {
        let model = WeatherForecastModel(context: context)
        model.weatherMain = WeatherMainModel.convert(dto: dto.weatherMain, into: context)
        model.system = WeatherSystemDataModel.convert(dto: dto.system, into: context)
        model.windData = WindDataModel.convert(dto: dto.windData, into: context)

        dto.data.forEach { dataPiece in
            model.data?.adding(WeatherDataModel.convert(dto: dataPiece, into: context))
        }
        model.cityName = dto.cityName
        model.visibility = dto.visibility

        return model
    }

    func convertToDTO() -> WeatherForecast {
        let weatherMainDTO: WeatherMain
        let windDataDTO: WindData
        let systemDTO: WeatherSystemData
        var dataDTO = [WeatherData]()

        if let weatherMain = weatherMain {
            weatherMainDTO = weatherMain.convertToDTO()
        } else {
            weatherMainDTO = WeatherMain(humidity: 0,
                                         feelsLike: 0,
                                         tempMin: 0,
                                         tempMax: 0,
                                         temp: 0,
                                         pressure: 0)
        }

        if let windData = windData {
            windDataDTO = windData.convertToDTO()
        } else {
            windDataDTO = WindData(speed: 0,
                                   degree: 0)
        }

        if let system = system {
            systemDTO = system.convertToDTO()
        } else {
            systemDTO = WeatherSystemData(country: "",
                                          sunset: Date(),
                                          sunrise: Date())
        }

        if let customData = data?.allObjects as? [WeatherDataModel] {
            customData.forEach { dataPiece in
                dataDTO.append(dataPiece.convertToDTO())
            }
        } else {
            dataDTO.removeAll()
            dataDTO.append(WeatherData(main: "", description: ""))
        }

        return WeatherForecast(weatherMain: weatherMainDTO,
                               windData: windDataDTO,
                               system: systemDTO,
                               data: dataDTO,
                               visibility: visibility,
                               cityName: cityName ?? "")
    }
}
