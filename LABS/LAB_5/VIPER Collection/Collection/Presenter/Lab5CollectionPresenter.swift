//
//  Lab5CollectionPresenter.swift
//  LABS
//
//  Created by Иван Тазенков on 29.03.2022.
//

import Foundation
import UIKit
class Lab5CollectionPresenter {
	
	var router: Lab5CollectionRouterIO?
	var interactor: Lab5CollectionInteractorIO?
	weak var view: Lab5CollectionViewIO?
}

extension Lab5CollectionPresenter: Lab5CollectionPresenterIO {
	
	func giveDataToCell(cell: Lab5CollectionViewCell, index: Int) {
		guard let data = interactor?.getData() else {
			cell.configure(image: UIImage(), title: "", subtitle: "")
			return
		}
		cell.configure(image: data[index].image, title: data[index].title, subtitle: data[index].subtitle)
	}
	
	func numberOfCells() -> Int {
		guard let data = interactor?.getData() else {
			return 0
		}
		return data.count
	}

	
	func userDidSelect() {
		router?.showDatePicker()
	}
}
