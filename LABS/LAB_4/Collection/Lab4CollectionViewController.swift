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

private let reuseIdentifier = "Lab4CollectionViewCell"

class Lab4CollectionViewController: UIViewController {
    private var collectioView: UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 150, height: 70)
        return UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectioView)
        title = "коллекция"
        setupColectionView()
        collectioView.register(Lab4CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectioView.delegate = self
        collectioView.dataSource = self
        collectioView.backgroundColor = .red
    }

    private func setupColectionView() {
        collectioView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectioView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectioView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectioView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectioView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension Lab4CollectionViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? Lab4CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(image: data[indexPath.row].image, title: data[indexPath.row].title, subtitle: data[indexPath.row].subtitle)
        cell.backgroundColor = UIColor(red: 0.6402, green: 0.6688, blue: 0.7257, alpha: 0.2)

        return cell
    }
//    func collectionView(_ collectionView: UICollectionView,
//                        viewForSupplementaryElementOfKind kind: String,
//                        at indexPath: IndexPath) -> UICollectionReusableView {
//        if kind == UICollectionView.elementKindSectionFooter {
//            let footer = collectionView.dequeueReusableSupplementaryView(
//                ofKind: UICollectionView.elementKindSectionFooter,
//                withReuseIdentifier: "FooterCollectionView",
//                for: indexPath)
//            return footer
//        }
//
//        let header = collectionView.dequeueReusableSupplementaryView(
//            ofKind: UICollectionView.elementKindSectionHeader,
//            withReuseIdentifier: "HeaderCollectionView",
//            for: indexPath)
//        return header
//    }
}

extension Lab4CollectionViewController: UICollectionViewDelegate {}

// extension Lab4CollectionViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        let inset: CGFloat = 10
//        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 150, height: 70)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: view.frame.size.width, height: 100)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        return CGSize(width: view.frame.size.width, height: 100)
//    }
// }
