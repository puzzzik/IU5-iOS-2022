//
//  Lab5CollectionInteractor.swift
//  LABS
//
//  Created by Иван Тазенков on 29.03.2022.
//

import Foundation
import UIKit
final class Lab5CollectionInteractor {
	weak var output: Lab5CollectionInteractorOutput!
}

extension Lab5CollectionInteractor: Lab5CollectionInteractorInput {
	func getData() -> [Lab5CollectionViewCellData] {
		let data: [Lab5CollectionViewCellData] = [
			Lab5CollectionViewCellData(
				image: UIImage(systemName: "square.and.arrow.down.fill")!,
				title: "Первая",
				subtitle: "Штучка"),
			Lab5CollectionViewCellData(
				image: UIImage(systemName: "pencil.tip.crop.circle.badge.plus")!,
				title: "Вторая",
				subtitle: "Рисовашка"),
			Lab5CollectionViewCellData(
				image: UIImage(systemName: "trash.slash.square")!,
				title: "Третья",
				subtitle: "Мусорка"),
		]
		return data
	}
}
