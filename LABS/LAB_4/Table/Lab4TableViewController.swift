//
//  Lab4TableViewController.swift
//  LABS
//
//  Created by Иван Тазенков on 20.03.2022.
//

import Foundation
import UIKit

final class Lab4TableViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        UITableView(frame: CGRect.zero, style: .grouped)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewController()
        setupTableViewConstraints()
    }
    
    private func setupTableViewController() {
        view.addSubview(tableView)
        title = "TableView"
        tableView.backgroundColor = .green
        tableView.delegate = self
        tableView.dataSource = self
    }
    private func setupTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)])
    }
}

extension Lab4TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
extension Lab4TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
}
