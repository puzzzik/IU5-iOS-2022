//
//  Lab5CollectionViewController.swift
//  LABS
//
//  Created by Иван Тазенков on 29.03.2022.
//

import Foundation
import UIKit

final class Lab5CollectionViewController: UIViewController {
	var output: Lab5CollectionViewOutput!
	
	private enum Constants {
		static let headerHeight: CGFloat = 20
		static let cellBackgroundColor: UIColor = .systemGray6
		static let inset: CGFloat = 12
		static let cellSize = CGSize(width: 160, height: 70)
	}
	
	private lazy var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		return UICollectionView(frame: .zero, collectionViewLayout: layout)
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupCollectionView()
		setupConstraints()
		registerCell()
		registerHeaderFooter()
	}
	
	private func registerHeaderFooter() {
		collectionView.register(Lab5CollectionViewHeaderFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
		collectionView.register(Lab5CollectionViewHeaderFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "Footer")
	}

	private func registerCell() {
		collectionView.register(Lab5CollectionViewCell.self, forCellWithReuseIdentifier: "Lab5CollectionViewCell")
	}
	
	private func setupCollectionView() {
		view.addSubview(collectionView)
		title = "коллекция"
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.backgroundColor = .systemBackground
	}
	
	private func setupConstraints() {
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			collectionView.topAnchor.constraint(
				equalTo: view.safeAreaLayoutGuide.topAnchor),
			collectionView.bottomAnchor.constraint(
				equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			collectionView.trailingAnchor.constraint(
				equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			collectionView.leadingAnchor.constraint(
				equalTo: view.safeAreaLayoutGuide.leadingAnchor),
		])
	}
}

extension Lab5CollectionViewController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView,
	                    didSelectItemAt indexPath: IndexPath)
	{
		output.userDidSelect()
	}
}

extension Lab5CollectionViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView,
	                    numberOfItemsInSection section: Int) -> Int
	{
		output.numberOfCells()
	}
	
	func collectionView(_ collectionView: UICollectionView,
	                    cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
	{
		guard let cell = collectionView.dequeueReusableCell(
			withReuseIdentifier: "Lab5CollectionViewCell",
			for: indexPath) as? Lab5CollectionViewCell
		else {
			return UICollectionViewCell()
		}
		output.giveDataToCell(cell: cell, index: indexPath.row)

		cell.backgroundColor = Constants.cellBackgroundColor
		return cell
	}

	func numberOfSections(in collectionView: UICollectionView) -> Int {
		1
	}

	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		if kind == UICollectionView.elementKindSectionFooter {
			let footer = collectionView.dequeueReusableSupplementaryView(
				ofKind: UICollectionView.elementKindSectionFooter,
				withReuseIdentifier: "Footer",
				for: indexPath) as! Lab5CollectionViewHeaderFooter
			footer.cofigure(text: "Футер", color: .systemBackground)
			return footer
		} else {
			let header = collectionView.dequeueReusableSupplementaryView(
				ofKind: UICollectionView.elementKindSectionHeader,
				withReuseIdentifier: "Header",
				for: indexPath) as! Lab5CollectionViewHeaderFooter
			header.cofigure(text: "Хедер", color: .systemBackground)
			return header
		}
	}
}

extension Lab5CollectionViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView,
	                    layout collectionViewLayout: UICollectionViewLayout,
	                    insetForSectionAt section: Int) -> UIEdgeInsets
	{
		return UIEdgeInsets(top: Constants.inset, left: Constants.inset, bottom: Constants.inset, right: Constants.inset)
	}
	
	func collectionView(_ collectionView: UICollectionView,
	                    layout collectionViewLayout: UICollectionViewLayout,
	                    sizeForItemAt indexPath: IndexPath) -> CGSize
	{
		return Constants.cellSize
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		return CGSize(width: view.frame.size.width, height: Constants.headerHeight)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
		return CGSize(width: view.frame.size.width, height: 20)
	}
}

extension Lab5CollectionViewController: Lab5CollectionViewInput {}
