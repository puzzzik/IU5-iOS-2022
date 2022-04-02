//
//  WeatherViewController.swift
//  LABS
//
//  Created by Иван Тазенков on 02.04.2022.
//

import Foundation
import UIKit

final class WeatherViewController: UIViewController {
	private let tableView = UITableView(frame: .zero, style: .grouped)
	
	private enum Constants {
		enum tableConstraints {
			static let topAnchor: CGFloat = 40
			static let bottomAnchor: CGFloat = -100
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
		setupTable()
	}
	
	private func setupView() {
		view.addSubview(tableView)
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
		tableView.dataSource = self
		tableView.delegate = self
	}
	
}

extension WeatherViewController: UITableViewDelegate {
	
}
extension WeatherViewController: UITableViewDataSource{
	
}
