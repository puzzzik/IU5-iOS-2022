//
//  InitialViewController.swift
//  LABS
//
//  Created by Иван Тазенков on 18.03.2022.
//

import Foundation
import UIKit

final class InitialViewController: UIViewController {
    private lazy var tableViewController: UITableView = .init(frame: CGRect.zero, style: .grouped)

    private enum CellsDisplayData: String, CaseIterable {
        case lab3 = "Лабораторная работа №3"
        case lab4 = "Лабораторная работа №4"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewController()
        setupTableViewConstraints()
    }

    private func setupTableViewConstraints() {
        tableViewController.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableViewController.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableViewController.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableViewController.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableViewController.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        tableViewController.contentInset = UIEdgeInsets(top: 150, left: 0, bottom: 0, right: 0)
    }

    private func setupTableViewController() {
        view.addSubview(tableViewController)
        title = "Список лабораторных работ"
//        view.backgroundColor = .systemGray6
        tableViewController.delegate = self
        tableViewController.dataSource = self
        tableViewController.backgroundColor = .systemBackground
        tableViewController.tableHeaderView = UIView(frame: CGRect(x: 0,
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

extension InitialViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
}

extension InitialViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        CellsDisplayData.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViewController.dequeueReusableCell(withIdentifier: "InitialViewControllerCell", for: indexPath) as? InitialViewControllerCell else {
            return UITableViewCell()
        }
        cell.configure(text: CellsDisplayData.allCases[indexPath.row].rawValue)

        return cell
    }
}
