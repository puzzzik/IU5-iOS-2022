//
//  Lab5CollectionInteractorIO.swift
//  LABS
//
//  Created by Иван Тазенков on 29.03.2022.
//

import Foundation

protocol Lab5CollectionInteractorInput: AnyObject {
	func getData() -> [Lab5CollectionViewCellData]
}

protocol Lab5CollectionInteractorOutput: AnyObject {}
