//
//  WeatherInteractorIO.swift
//  LABS
//
//  Created by Иван Тазенков on 03.04.2022.
//

import Foundation

protocol WeatherInteractorInput: AnyObject {
    func loadData(cityName: String?)
}

protocol WeatherInteractorOutput: AnyObject {
    func setWeatherForecast(forecast: WeatherForecast)
    func didReceiveError(_ error: Error)
}
