//
//  WeatherViewIO.swift
//  LABS
//
//  Created by Иван Тазенков on 02.04.2022.
//

import Foundation
import UIKit

protocol WeatherViewInput: AnyObject {
	func reload()
}

protocol WeatherViewOutput: AnyObject {
	func cellForRow(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
	func numberOfRowsInSection() -> Int
	func numberOfSections() -> Int
}
