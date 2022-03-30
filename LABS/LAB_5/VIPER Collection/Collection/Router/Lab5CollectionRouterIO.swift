//
//  Lab5CollectionRouterIO.swift
//  LABS
//
//  Created by Иван Тазенков on 30.03.2022.
//

import Foundation

protocol Lab5CollectionRouterIO: AnyObject {
	var presenter: Lab5CollectionPresenterIO? { get set }
	
	func showDatePicker()
}
