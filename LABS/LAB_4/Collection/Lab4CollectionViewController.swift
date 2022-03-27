//
//  Lab4CollectionViewController.swift
//  LABS
//
//  Created by Иван Тазенков on 21.03.2022.
//

import UIKit

struct DataStruct {
    var image: UIImage?
    var title: String?
    var subtitle: String?
}

var data: [DataStruct] = [
    DataStruct(
        image: UIImage(systemName: "square.and.arrow.down.fill"),
        title: "Первая",
        subtitle: "Штучка"),
    DataStruct(
        image: UIImage(systemName: "pencil.tip.crop.circle.badge.plus"),
        title: "Вторая",
        subtitle: "Рисовашка"),
    DataStruct(
        image: UIImage(systemName: "trash.slash.square"),
        title: "Третья",
        subtitle: "Мусорка"),
]

class Lab4CollectionViewController: UIViewController {
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
        collectionView.register(Lab4CollectionViewHeaderFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
        collectionView.register(Lab4CollectionViewHeaderFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "Footer")
    }
    private func registerCell() {
        collectionView.register(Lab4CollectionViewCell.self, forCellWithReuseIdentifier: "Lab4CollectionViewCell")
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

extension Lab4CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        let viewController = Lab4DateViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension Lab4CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "Lab4CollectionViewCell",
            for: indexPath) as? Lab4CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(image: data[indexPath.row].image,
                       title: data[indexPath.row].title,
                       subtitle: data[indexPath.row].subtitle)
        cell.backgroundColor = UIColor(red: 0.6402, green: 0.6688, blue: 0.7257, alpha: 0.2)
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
                for: indexPath) as! Lab4CollectionViewHeaderFooter
            footer.cofigure(text: "Футер", color: .systemOrange)
            return footer
        } else {

        let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: "Header",
                for: indexPath) as! Lab4CollectionViewHeaderFooter
        header.cofigure(text: "Хедер", color: .systemTeal)
        return header
        
        }
    }
}

extension Lab4CollectionViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset: CGFloat = 10
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 100)
    }
}
