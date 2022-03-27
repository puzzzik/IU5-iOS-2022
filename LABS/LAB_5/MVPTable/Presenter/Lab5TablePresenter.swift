//
//  Lab5TablePresenter.swift
//  LABS
//
//  Created by Иван Тазенков on 27.03.2022.
//

import Foundation

final class Lab5TablePresenter {
    weak var view: Lab5TableViewInput!
    weak var moduleOutput: Lab5TableModuleOutput!
}

extension Lab5TablePresenter: Lab5TableViewOutput {}
