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
        title = "Табличечка"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .systemBackground
        registerCell()
    }
    private func setupTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)])
    
    tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    private func registerCell() {
        tableView.register(Lab4TableViewControllerCell.self, forCellReuseIdentifier: "Lab4TableViewControllerCell")
    }
}

extension Lab4TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
extension Lab4TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Lab4TableViewControllerCell") as? Lab4TableViewControllerCell else {
            return UITableViewCell()
        }
        cell.configure(title: "Main view",
                       subtitle: "Opens view with UIKit stuff",
                       image: UIImage(systemName: "doc.circle"))
        return cell
                
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
}
