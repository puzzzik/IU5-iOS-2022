//
//  Lab5CollectionInteractorIO.swift
//  LABS
//
//  Created by Иван Тазенков on 29.03.2022.
//

import Foundation

protocol Lab5CollectionInteractorIO {
	
	var presenter: Lab5CollectionPresenterIO? { get set }
	
	func getData() -> [Lab5CollectionViewCellData]
}
