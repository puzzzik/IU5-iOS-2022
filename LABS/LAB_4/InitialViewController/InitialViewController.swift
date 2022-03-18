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
            tableViewController.topAnchor.constraint(equalTo: view.topAnchor),
            tableViewController.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func setupTableViewController() {
        view.addSubview(tableViewController)
        tableViewController.delegate = self
        tableViewController.dataSource = self
        tableViewController.backgroundColor = .systemGray6
    }
}

extension InitialViewController: UITableViewDelegate {}

extension InitialViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}
