//
//  Lab5CollectionPresenter.swift
//  LABS
//
//  Created by Иван Тазенков on 29.03.2022.
//

import Foundation
final class Lab5CollectionPresenter {
	weak var view: Lab5CollectionViewInput!
	weak var moduleOutput: Lab5CollectionModuleOutput!
	
	var interactor: Lab5CollectionInteractorInput
	
	init(interactor: Lab5CollectionInteractorInput) {
		self.interactor = interactor
	}
}


extension Lab5CollectionPresenter: Lab5CollectionViewOutput {
}

extension Lab5CollectionPresenter: Lab5CollectionModuleInput {
	
}

extension Lab5CollectionPresenter: Lab5CollectionInteractorOutput {
	
}

