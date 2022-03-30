//
//  Lab5StuffViewIO.swift
//  LABS
//
//  Created by Иван Тазенков on 30.03.2022.
//

import Foundation
import UIKit

protocol Lab5StuffViewInput: AnyObject {
	
}

protocol Lab5StuffViewOutput: AnyObject {
	func userDidChangeSlider(label: UILabel?, slider: UISlider?)
	func userDidChangeSwitch (label: UILabel?, switcher: UISwitch?, textField: UITextField?)
	func userDidChangeTextField (label: UILabel?, switcher: UISwitch?)
	func userDidChangeSegmentControl (label: UILabel?, segmentControl: UISegmentedControl?)
	func userDidTouchButton (label: UILabel?) -> UIAlertController?
}
