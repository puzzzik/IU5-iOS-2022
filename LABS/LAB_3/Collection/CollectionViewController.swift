//
//  CollectionController.swift
//  Lab3Swift
//
//  Created by Иван Тазенков on 16.03.2022.
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
        subtitle: "Штучка"
    ),
    DataStruct(
        image: UIImage(systemName: "pencil.tip.crop.circle.badge.plus"),
        title: "Вторая",
        subtitle: "Рисовашка"
    ),
    DataStruct(
        image: UIImage(systemName: "trash.slash.square"),
        title: "Третья",
        subtitle: "Мусорка"
    )
]
class CollectionViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
    }

    private func setupCollection() {
        title = "коллекция"
        collectionView.delegate = self
        collectionView.dataSource = self
        let cellNib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "CollectionViewCell")
    }
}

extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dateViewController = storyboard.instantiateViewController(identifier: "DateViewController")

        show(dateViewController, sender: self)
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell

        cell.configure(image: data[indexPath.row].image, title: data[indexPath.row].title, subtitle: data[indexPath.row].subtitle)
        cell.backgroundColor = UIColor(red: 0.6402, green: 0.6688, blue: 0.7257, alpha: 0.2)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionFooter {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "FooterCollectionView", for: indexPath)
            return footer
        }

        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionView", for: indexPath)
        return header
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset: CGFloat = 10
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 70)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 100)
    }
}
