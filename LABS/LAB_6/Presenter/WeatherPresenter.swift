//
//  WeatherPresenter.swift
//  LABS
//
//  Created by Иван Тазенков on 02.04.2022.
//

import Foundation
import UIKit

final class WeatherPresenter {
	weak var view: WeatherViewInput!
	weak var moduleOutput: WeatherModuleOutput!

	private let propertyNames = [
		0: "Условия",
		1: "Температура",
		2: "Мин. температура",
		3: "Макс. температура",
		4: "Ощущается как",
		5: "Видимость",
		6: "Восход",
		7: "Закат",
		8: "Город",
		9: "Страна",
	]
	private var propertyResults: [Int: String] = [:]

	var interactor: WeatherInteractorInput!

	init(interactor: WeatherInteractorInput) {
		self.interactor = interactor
		NotificationCenter.default.addObserver(self, selector: #selector(getCityName), name: NSNotification.Name("textFieldDidEditingEnd"), object: nil)
	}

	@objc func getCityName(_ notification: Notification) {
		guard let cityName = notification.object as? String else {
			print("NO CITY ENTERED")
			return
		}
		let trimmedCityName = cityName.trimmingCharacters(in: .whitespacesAndNewlines)
		interactor.setCityName(cityName: trimmedCityName)
		NotificationCenter.default.post(name: NSNotification.Name("userDidTypedCityName"), object: nil)
	}
}

extension WeatherPresenter: WeatherViewOutput {
	func numberOfSections() -> Int {
		1
	}

	func cellForRow(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell") as? WeatherTableViewCell else {
			return UITableViewCell()
		}
		cell.configure(propertyName: propertyNames[indexPath.row]!,
		               propertyResult: propertyResults[indexPath.row])
		return cell
	}

	func numberOfRowsInSection() -> Int {
		propertyNames.count
	}
}

extension WeatherPresenter: WeatherModuleInput {}

extension WeatherPresenter: WeatherInteractorOutput {
	func setWeatherForecast(forecast: WeatherForecast) {
		propertyResults[0] = String(forecast.data[0].description)
		propertyResults[1] = String(forecast.weatherMain.temp)
		propertyResults[2] = String(forecast.weatherMain.tempMin)
		propertyResults[3] = String(forecast.weatherMain.tempMax)
		propertyResults[4] = String(forecast.weatherMain.feelsLike)
		propertyResults[5] = String(forecast.visibility)
		propertyResults[6] = forecast.system.sunrise.formatted(date: .omitted,
		                                                       time: .shortened)
		propertyResults[7] = forecast.system.sunset.formatted(date: .omitted,
		                                                      time: .shortened)
		propertyResults[8] = forecast.cityName
		propertyResults[9] = forecast.system.country

		view.reload()
	}
}
