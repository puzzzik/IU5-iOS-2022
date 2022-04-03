//
//  WeatherViewController.swift
//  LABS
//
//  Created by Иван Тазенков on 02.04.2022.
//

import Foundation
import UIKit

class WeatherViewController: UIViewController {
	private let tableView = UITableView(frame: .zero, style: .grouped)

	var output: WeatherViewOutput!

	var textFieldText: String?

	private enum Constants {
		enum tableConstraints {
			static let topAnchor: CGFloat = 40
			static let bottomAnchor: CGFloat = -100
		}

		static let headerHeight: CGFloat = 50
		static let cellHeight: CGFloat = 50
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
		setupTable()
		registerCell()
		registerHeader()
	}

	private func setupView() {
		view.addSubview(tableView)
		tableView.backgroundColor = .systemBackground
		tableView.translatesAutoresizingMaskIntoConstraints = false
		view.addConstraints([
			tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
			                               constant: Constants.tableConstraints.topAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
			                                  constant: Constants.tableConstraints.bottomAnchor),
		])
	}

	private func setupTable() {
		title = "Погода"
		tableView.dataSource = self
		tableView.delegate = self
		tableView.allowsSelection = false
	}

	private func registerCell() {
		tableView.register(WeatherTableViewCell.self,
		                   forCellReuseIdentifier: "WeatherTableViewCell")
	}

	private func registerHeader() {
		tableView.register(WeatherTableViewHeader.self,
		                   forHeaderFooterViewReuseIdentifier: "WeatherTableViewHeader")
	}
}

extension WeatherViewController: UITableViewDelegate {}

extension WeatherViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		output.numberOfRowsInSection()
	}

	func numberOfSections(in tableView: UITableView) -> Int {
		output.numberOfSections()
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return output.cellForRow(tableView, cellForRowAt: indexPath)
	}

	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		guard let header = tableView.dequeueReusableHeaderFooterView(
			withIdentifier: "WeatherTableViewHeader") as? WeatherTableViewHeader
		else {
			return UIView()
		}
		return header
	}

	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		Constants.headerHeight
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		Constants.cellHeight
	}
}

extension WeatherViewController: WeatherViewInput {
	func reload() {
		DispatchQueue.main.async { [weak self] in
			self?.tableView.reloadData()
		}
	}
}
