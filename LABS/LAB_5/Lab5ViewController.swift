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
            tableButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -40),
            tableButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 40),
            tableButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            tableButton.rightAnchor.constraint(equalTo: view.leftAnchor, constant: 180),
        ])

        tableButton.backgroundColor = .systemGray5
        tableButton.addTarget(self, action: #selector(didSelectTableViewButton), for: .touchUpInside)
    }

    private func setupCollectionButton() {
        collectionButton.setTitle("CollectionView", for: .normal)
        collectionButton.backgroundColor = .systemGray5
        collectionButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -40),
            collectionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 40),
            collectionButton.leftAnchor.constraint(equalTo: view.rightAnchor, constant: -180),
            collectionButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
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
        let viewController = Lab4CollectionViewController()
		present(viewController, animated: true) { [weak self] in
			self?.openedViewController = viewController
		}
    }
}

extension Lab5ViewController: Lab5TableModuleOutput {
	
	func lab5TableModuleWantsToOpenStuffModule() {
		let builder = Lab5StuffBuilder()
		let viewController = builder.build()
		present(viewController, animated: true)
	}
}
