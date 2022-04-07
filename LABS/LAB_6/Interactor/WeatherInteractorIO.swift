//
//  WeatherInteractorIO.swift
//  LABS
//
//  Created by Иван Тазенков on 03.04.2022.
//

import Foundation

protocol WeatherInteractorInput: AnyObject {
    func loadDataForCity(cityName: String)
    func loadData()
}

protocol WeatherInteractorOutput: AnyObject {
    func setWeatherForecast(forecast: WeatherForecast)
}
