//
//  Lab4TableViewController.swift
//  LABS
//
//  Created by Иван Тазенков on 20.03.2022.
//

import Foundation
import UIKit

final class Lab4TableViewController: UIViewController {
    private lazy var tableView: UITableView = .init(frame: CGRect.zero, style: .grouped)

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
        registerHeader()
        registerFooter()
    }

    private func setupTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])

        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    private func registerCell() {
        tableView.register(Lab4TableViewControllerCell.self, forCellReuseIdentifier: "Lab4TableViewControllerCell")
    }

    private func registerHeader() {
        tableView.register(Lab4TableViewHeaderFooterView.self,
                           forHeaderFooterViewReuseIdentifier: "HeaderView")
    }

    private func registerFooter() {
        tableView.register(Lab4TableViewHeaderFooterView.self,
                           forHeaderFooterViewReuseIdentifier: "FooterView")
    }
}

extension Lab4TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = Lab4StuffViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }

    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView?
    {
        guard let header = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: "HeaderView") as? Lab4TableViewHeaderFooterView
        else {
            return UIView()
        }
        header.configure(text: "All views")
        return header
    }

    func tableView(_ tableView: UITableView,
                   viewForFooterInSection section: Int) -> UIView?
    {
        guard let footer = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: "FooterView") as? Lab4TableViewHeaderFooterView
        else {
            return UIView()
        }
        footer.configure(text: "TODO: - Add some new views")
        return footer
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
