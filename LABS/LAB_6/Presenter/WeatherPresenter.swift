//
//  WeatherPresenter.swift
//  LABS
//
//  Created by Иван Тазенков on 02.04.2022.
//

import Foundation

// MARK: - WeatherPresenter

final class WeatherPresenter {
    // MARK: Private Properties

    private let weatherDisplayDataFactory: WeatherDisplayDataFactoryProtocol
    private var forecast: WeatherForecast?
    private let tableHeaderPlaceholderText = "Введите город"

    // MARK: Internal Properties

    weak var view: WeatherViewInput!
    weak var moduleOutput: WeatherModuleOutput!
    var interactor: WeatherInteractorInput!

    // MARK: Lifecycle

    init(interactor: WeatherInteractorInput, weatherDataDisplayFactory: WeatherDisplayDataFactory) {
        self.interactor = interactor
        weatherDisplayDataFactory = weatherDataDisplayFactory
    }
}

// MARK: WeatherViewOutput

extension WeatherPresenter: WeatherViewOutput {
    func viewDidLoad() {
        interactor.loadData()
    }

    func displayData(for indexPath: IndexPath) -> WeatherTableViewCell.DisplayData {
        return weatherDisplayDataFactory.displayData(for: indexPath, from: forecast)
    }

    func numberOfSections() -> Int {
        WeatherSection.allCases.count
    }

    func numberOfRowsInSection(inSection section: Int) -> Int {
        guard let section = WeatherSection(rawValue: section) else {
            assertionFailure("Unrecognized section with index \(section)")
            return 0
        }
        return section.numberOfItems
    }

    func displayDataForHeader() -> WeatherTableViewHeader.DisplayData {
        let displayData = weatherDisplayDataFactory.tableHeaderDisplayData(with: tableHeaderPlaceholderText) { [weak self] cityName in
            self?.interactor.loadDataForCity(cityName: cityName)
        }
        return displayData
    }
}

// MARK: WeatherModuleInput

extension WeatherPresenter: WeatherModuleInput {
}

// MARK: WeatherInteractorOutput

extension WeatherPresenter: WeatherInteractorOutput {
    func setWeatherForecast(forecast: WeatherForecast) {
        self.forecast = forecast
        view.reload()
    }
}
