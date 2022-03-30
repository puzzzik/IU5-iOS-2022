//
//  Lab5TableViewController.swift
//  LABS
//
//  Created by Иван Тазенков on 27.03.2022.
//

import Foundation
import UIKit

final class Lab5TableViewController: UIViewController {
	private var tableView: UITableView = .init(frame: CGRect.zero, style: .grouped)

    var output: Lab5TableViewOutput!

	private enum Constants {
		static let rowHeight: CGFloat = 60
		static let headerHeight: CGFloat = 50
	}
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
		view.addConstraints([
			tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
			tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
		])
		
		tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	}
	
	private func registerCell() {
		tableView.register(Lab5TableViewControllerCell.self, forCellReuseIdentifier: "Lab5TableViewControllerCell")
	}
	
	private func registerHeader() {
		tableView.register(Lab5TableViewHeaderFooterView.self,
						   forHeaderFooterViewReuseIdentifier: "HeaderView")
	}
	
	private func registerFooter() {
		tableView.register(Lab5TableViewHeaderFooterView.self,
						   forHeaderFooterViewReuseIdentifier: "FooterView")
	}
}

extension Lab5TableViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		Constants.rowHeight
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		Constants.headerHeight
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		output.userDidSelectRow()
	}
	
	func tableView(_ tableView: UITableView,
				   viewForHeaderInSection section: Int) -> UIView?
	{
		output.setHeader(tableView, viewForHeaderInSection: section)
	}
	
	func tableView(_ tableView: UITableView,
				   viewForFooterInSection section: Int) -> UIView?
	{
		output.setFooter(tableView, viewForFooterInSection: section)
	}
}

extension Lab5TableViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		output.cellForRowAt(tableView, cellForRowAt: indexPath)
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		1
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		1
	}
}

extension Lab5TableViewController: Lab5TableViewInput {}

