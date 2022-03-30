//
//  Lab5CollectionPresenterIO.swift
//  LABS
//
//  Created by Иван Тазенков on 29.03.2022.
//

import Foundation

protocol Lab5CollectionPresenterIO: AnyObject {
	
	var router: Lab5CollectionRouterIO? { get set }
	var interactor: Lab5CollectionInteractorIO? { get set }
	var view: Lab5CollectionViewIO? { get set }
	
	func giveDataToCell(cell: Lab5CollectionViewCell, index: Int)
	func numberOfCells() -> Int
	func userDidSelect()
	
}

