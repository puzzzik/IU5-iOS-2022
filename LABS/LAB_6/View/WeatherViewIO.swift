//
//  WeatherViewIO.swift
//  LABS
//
//  Created by Иван Тазенков on 02.04.2022.
//

import Foundation

// MARK: - WeatherViewInput

protocol WeatherViewInput: AnyObject {
    func reload()
    func showAlert(title: String, message: String, error: Error)
}

// MARK: - WeatherViewOutput

protocol WeatherViewOutput: AnyObject {
    func displayData(for indexPath: IndexPath) -> WeatherTableViewCell.DisplayData
    func displayDataForHeader() -> WeatherTableViewHeader.DisplayData
    func numberOfRowsInSection(inSection section: Int) -> Int
    func numberOfSections() -> Int
    func viewDidLoad()
}
