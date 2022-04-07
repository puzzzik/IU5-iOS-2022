//
//  WeatherViewController.swift
//  LABS
//
//  Created by Иван Тазенков on 02.04.2022.
//

import Foundation
import UIKit

// MARK: - WeatherViewController

class WeatherViewController: UIViewController {
    // MARK: Internal

    var output: WeatherViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHeader()
        setupTable()
        registerCell()
        output.viewDidLoad()
    }

    // MARK: Private

    private enum Constants {
        static let headerHeight: CGFloat = 50
        static let cellHeight: CGFloat = 50
    }

    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    private let headerView = WeatherTableViewHeader(frame: .zero)

    private func setupView() {
        title = "Weather Forecast"
        view.backgroundColor = .systemBackground

    }

    private func setupTable() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

    private func registerCell() {
        tableView.register(WeatherTableViewCell.self,
                           forCellReuseIdentifier: "WeatherTableViewCell")
    }

    private func setupHeader() {
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            headerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                               constant: Constants.headerHeight),
        ])
        let displayData = output.displayDataForHeader()
        headerView.configure(displayData: displayData)
    }
}

// MARK: UITableViewDelegate

extension WeatherViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.cellHeight
    }
}

// MARK: UITableViewDataSource

extension WeatherViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        output.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        output.numberOfRowsInSection(inSection: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell",
                                                       for: indexPath) as? WeatherTableViewCell
        else {
            return UITableViewCell()
        }
        let displayData = output.displayData(for: indexPath)
        cell.configure(with: displayData)
        return cell
    }
}

// MARK: WeatherViewInput

extension WeatherViewController: WeatherViewInput {
    func reload() {
        tableView.reloadData()
    }
}
