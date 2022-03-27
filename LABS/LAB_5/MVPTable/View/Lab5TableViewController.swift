//
//  Lab5TableViewController.swift
//  LABS
//
//  Created by Иван Тазенков on 27.03.2022.
//

import Foundation
import UIKit

final class Lab5TableViewController: UIViewController {
    var output: Lab5TableViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension Lab5TableViewController: Lab5TableViewInput {}
