//
//  Lab5CollectionViewIO.swift
//  LABS
//
//  Created by Иван Тазенков on 29.03.2022.
//

import Foundation
protocol Lab5CollectionViewInput: AnyObject {}

protocol Lab5CollectionViewOutput: AnyObject {
	func giveDataToCell(cell: Lab5CollectionViewCell, index: Int)
	func numberOfCells() -> Int
	func userDidSelect()
}
