//
//  WeatherDisplayDataFactory.swift
//  LABS
//
//  Created by Иван Тазенков on 07.04.2022.
//

import Foundation

// MARK: - WeatherSection

enum WeatherSection: Int, CaseIterable {
    case city
    case main
    case wind
    case system
    case data

    // MARK: Internal

    var numberOfItems: Int {
        switch self {
        case .main: return 6
        case .wind: return 2
        case .system: return 3
        case .data: return 2
        case .city: return 2
        }
    }
}

// MARK: - WeatherDisplayDataFactoryProtocol

protocol WeatherDisplayDataFactoryProtocol {
    func tableHeaderDisplayData(with placeholder: String, action: @escaping (String) -> Void) -> WeatherTableViewHeader.DisplayData
    func displayData(for indexPath: IndexPath,
                     from forecast: WeatherForecast?) -> WeatherTableViewCell.DisplayData
}

// MARK: - WeatherDisplayDataFactory

final class WeatherDisplayDataFactory: WeatherDisplayDataFactoryProtocol {
    func tableHeaderDisplayData(with placeholder: String, action: @escaping (String) -> Void) -> WeatherTableViewHeader.DisplayData {
        let dd = WeatherTableViewHeader.DisplayData(placeholderText: placeholder, action: action)
        return dd
    }

    func displayData(for indexPath: IndexPath, from forecast: WeatherForecast?) -> WeatherTableViewCell.DisplayData {
        guard let section = WeatherSection(rawValue: indexPath.section) else {
            assertionFailure("unknown section")
            return WeatherTableViewCell.DisplayData(title: "", content: "")
        }
        switch section {
        case .main:
            switch indexPath.row {
            case 0:
                return WeatherTableViewCell.DisplayData(title: "Temperature", content: "\(forecast?.weatherMain.temp ?? 0)")
            case 1:
                return WeatherTableViewCell.DisplayData(title: "Feels like", content: "\(forecast?.weatherMain.feelsLike ?? 0)")
            case 2:
                return WeatherTableViewCell.DisplayData(title: "Max temperature", content: "\(forecast?.weatherMain.tempMax ?? 0)")
            case 3:
                return WeatherTableViewCell.DisplayData(title: "Min temperature", content: "\(forecast?.weatherMain.tempMin ?? 0)")
            case 4:
                return WeatherTableViewCell.DisplayData(title: "Humidity", content: "\(forecast?.weatherMain.humidity ?? 0)")
            case 5:
                return WeatherTableViewCell.DisplayData(title: "Pressure", content: "\(forecast?.weatherMain.pressure ?? 0)")
            default:
                assertionFailure("unknown indexPath row ")
                return WeatherTableViewCell.DisplayData(title: "Unknown", content: "Unknown")
            }
        case .wind:
            switch indexPath.row {
            case 0:
                return WeatherTableViewCell.DisplayData(title: "Wind speed", content: "\(forecast?.windData.speed ?? 0)")
            case 1:
                return WeatherTableViewCell.DisplayData(title: "Wind direction", content: "\(forecast?.windData.degree ?? 0)")
            default:
                assertionFailure("unknown indexPath row ")
                return WeatherTableViewCell.DisplayData(title: "Unknown", content: "Unknown")
            }
        case .system:
            switch indexPath.row {
            case 0:
                return WeatherTableViewCell.DisplayData(title: "Sunrise", content: "\(forecast?.system.sunrise.formatted(date: .omitted, time: .shortened) ?? "")")
            case 1:
                return WeatherTableViewCell.DisplayData(title: "Sunset", content: "\(forecast?.system.sunset.formatted(date: .omitted, time: .shortened) ?? "")")
            case 2:
                return WeatherTableViewCell.DisplayData(title: "Country", content: "\(forecast?.system.country ?? "")")
            default:
                assertionFailure("unknown indexPath row ")
                return WeatherTableViewCell.DisplayData(title: "Unknown", content: "Unknown")
            }
        case .data:
            switch indexPath.row {
            case 0:
                return WeatherTableViewCell.DisplayData(title: "Weather condition", content: "\(forecast?.data.first?.main ?? "")")
            case 1:
                return WeatherTableViewCell.DisplayData(title: "Weather description", content: "\(forecast?.data.first?.description ?? "")")
            default:
                assertionFailure("unknown indexPath row ")
                return WeatherTableViewCell.DisplayData(title: "Unknown", content: "Unknown")
            }
        case .city:
            switch indexPath.row {
            case 0:
                return WeatherTableViewCell.DisplayData(title: "City", content: "\(forecast?.cityName ?? "")")
            case 1:
                return WeatherTableViewCell.DisplayData(title: "Visibility", content: "\(forecast?.visibility ?? 0)")
            default:
                assertionFailure("unknown indexPath row ")
                return WeatherTableViewCell.DisplayData(title: "Unknown", content: "Unknown")
            }
        }
    }
}
