//
//  Lab5ViewController.swift
//  LABS
//
//  Created by Иван Тазенков on 27.03.2022.
//

import Foundation
import UIKit

class Lab5ViewController: UIViewController {
	private let tableButton = UIButton(type: .system)
	private let collectionButton = UIButton(type: .system)
	private var openedViewController: UIViewController?

	private enum Constants {
		enum tableButton {
			static let topAnchorFromCenterYAnchor: CGFloat = -40
			static let bottomAnchorFromCenterYAnchor: CGFloat = 40
			static let leftAnchor: CGFloat = 40
			static let rightAnchorFromLeftAnchor: CGFloat = 180
		}

		enum collectionButton {
			static let topAnchorFromCenterYAnchor: CGFloat = -40
			static let bottomAnchorFromCenterYAnchor: CGFloat = 40
			static let leftAnchorFromRightAnchor: CGFloat = -180
			static let rightAnchor: CGFloat = -40
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		setupViewController()
		setupTableButton()
		setupCollectionButton()
	}

	private func setupViewController() {
		title = "Лабораторная работа №5"
		view.addSubview(tableButton)
		view.addSubview(collectionButton)
	}

	private func setupTableButton() {
		tableButton.setTitle("TableView", for: .normal)
		tableButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			tableButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor,
			                                 constant: Constants.tableButton.topAnchorFromCenterYAnchor),
			tableButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor,
			                                    constant: Constants.tableButton.bottomAnchorFromCenterYAnchor),
			tableButton.leftAnchor.constraint(equalTo: view.leftAnchor,
			                                  constant: Constants.tableButton.leftAnchor),
			tableButton.rightAnchor.constraint(equalTo: view.leftAnchor,
			                                   constant: Constants.tableButton.rightAnchorFromLeftAnchor),
		])

		tableButton.backgroundColor = .systemGray5
		tableButton.addTarget(self, action: #selector(didSelectTableViewButton), for: .touchUpInside)
	}

	private func setupCollectionButton() {
		collectionButton.setTitle("CollectionView", for: .normal)
		collectionButton.backgroundColor = .systemGray5
		collectionButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			collectionButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor,
			                                      constant: Constants.collectionButton.topAnchorFromCenterYAnchor),
			collectionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor,
			                                         constant: Constants.collectionButton.bottomAnchorFromCenterYAnchor),
			collectionButton.leftAnchor.constraint(equalTo: view.rightAnchor,
			                                       constant: Constants.collectionButton.leftAnchorFromRightAnchor),
			collectionButton.rightAnchor.constraint(equalTo: view.rightAnchor,
			                                        constant: Constants.collectionButton.rightAnchor),
		])
		collectionButton.backgroundColor = .systemGray5
		collectionButton.addTarget(self, action: #selector(didSelectCollectionViewButton), for: .touchUpInside)
	}

	@objc private func didSelectTableViewButton(_ sender: UIButton!) {
		let builder = Lab5TableBuilder()
		let viewController = builder.build(output: self)
		navigationController?.pushViewController(viewController, animated: true)
	}

	@objc private func didSelectCollectionViewButton(_ sender: UIButton!) {
		let builder = Lab5CollectionBuilder()
		let viewController = builder.build()
		navigationController?.pushViewController(viewController, animated: true)
	}
}

extension Lab5ViewController: Lab5TableModuleOutput {
	func lab5TableModuleWantsToOpenStuffModule() {
		let builder = Lab5StuffBuilder()
		let viewController = builder.build()
		present(viewController, animated: true)
	}
}
