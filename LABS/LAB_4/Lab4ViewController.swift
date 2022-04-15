//
//  Lab4ViewController.swift
//  LABS
//
//  Created by Иван Тазенков on 20.03.2022.
//

import UIKit

class Lab4ViewController: UIViewController {
    private let tableButton = UIButton(type: .system)
    private let collectionButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setupTableButton()
        setupCollectionButton()
    }

    private func setupViewController() {
        title = "Лабораторная работа №4"
        view.backgroundColor = .systemBackground
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
    

    @objc func didSelectTableViewButton(_ sender: UIButton!) {
        let viewController = Lab4TableViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    @objc func didSelectCollectionViewButton(_ sender: UIButton!) {
        let viewController = Lab4CollectionViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
