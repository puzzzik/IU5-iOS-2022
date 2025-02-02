//
//  InitialViewController.swift
//  LABS
//
//  Created by Иван Тазенков on 18.03.2022.
//

import Foundation
import UIKit

// MARK: - InitialViewController

final class InitialViewController: UIViewController {
    // MARK: Private Properties

    private lazy var tableViewController: UITableView = .init(frame: CGRect.zero, style: .grouped)
    private let tableInset = UIEdgeInsets(top: 150, left: 0, bottom: 0, right: 0)

    // MARK: Private Data Struct

    private enum CellsDisplayData: String, CaseIterable {
        case lab3 = "Лабораторная работа №3"
        case lab4 = "Лабораторная работа №4"
        case lab5 = "Лабораторная работа №5"
        case lab6 = "Лабораторная работа №6"
    }

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Список лабораторных работ"
        view.backgroundColor = .systemBackground
        setupTableViewController()
        setupTableViewConstraints()
    }

    // MARK: Private Methods

    private func setupTableViewConstraints() {
        tableViewController.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableViewController.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableViewController.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableViewController.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableViewController.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        tableViewController.contentInset = tableInset
    }

    private func setupTableViewController() {
        view.addSubview(tableViewController)
        tableViewController.delegate = self
        tableViewController.dataSource = self
        tableViewController.backgroundColor = .systemBackground
        tableViewController.tableHeaderView = UIView(
            frame: CGRect(x: 0,
                          y: 0,
                          width: tableViewController.frame.width,
                          height: CGFloat.leastNormalMagnitude))
        registerCell()
    }

    private func registerCell() {
        tableViewController.register(InitialViewControllerCell.self,
                                     forCellReuseIdentifier: "InitialViewControllerCell")
    }
}

// MARK: UITableViewDelegate

extension InitialViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let viewController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "Lab3Storyboard")
            navigationController?.pushViewController(viewController, animated: true)
        case 1:
            let viewController = Lab4ViewController()
            navigationController?.pushViewController(viewController, animated: true)
        case 2:
            let viewController = Lab5ViewController()
            navigationController?.pushViewController(viewController, animated: true)
        case 3:
            let builder = WeatherBuilder()
            let viewController = builder.build()
            navigationController?.pushViewController(viewController, animated: true)
        default:
            assertionFailure("unknown indexPath in InitialViewController")
        }
    }
}

// MARK: UITableViewDataSource

extension InitialViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        CellsDisplayData.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViewController.dequeueReusableCell(withIdentifier: "InitialViewControllerCell",
                                                                 for: indexPath) as? InitialViewControllerCell
        else {
            return UITableViewCell()
        }
        cell.configure(text: CellsDisplayData.allCases[indexPath.row].rawValue)

        return cell
    }
}
