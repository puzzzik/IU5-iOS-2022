//
//  Lab5TableBuilder.swift
//  LABS
//
//  Created by Иван Тазенков on 27.03.2022.
//

import Foundation
import UIKit

final class Lab5TableBuilder {
    func build(output: Lab5TableModuleOutput) -> UIViewController {
        let viewController = Lab5TableViewController()
        let presenter = Lab5TablePresenter()

        viewController.output = presenter
        presenter.view = viewController
        presenter.moduleOutput = output

        return viewController
    }
}
