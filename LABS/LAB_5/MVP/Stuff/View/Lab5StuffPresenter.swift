//
//  Lab5StuffPresenter.swift
//  LABS
//
//  Created by Иван Тазенков on 30.03.2022.
//

import Foundation
import UIKit

final class Lab5StuffPresenter {
	weak var view: Lab5StuffViewInput!
}

extension Lab5StuffPresenter: Lab5StuffViewOutput {
	func userDidChangeSlider(label: UILabel?, slider: UISlider?) {
		if let label = label,
		   let slider = slider
		{
			label.text = "\(Int(slider.value))/100"
		}
	}
	
	func userDidChangeSwitch(label: UILabel?, switcher: UISwitch?, textField: UITextField?) {
		if let switcher = switcher,
		   let label = label,
		   let textField = textField
		{
			if switcher.isOn {
				label.text = "вкл"
			} else {
				textField.resignFirstResponder()
				label.text = "выкл"
			}
		}
	}
	
	func userDidChangeTextField(label: UILabel?, switcher: UISwitch?) {
		if let label = label,
		   let switcher = switcher
		{
			label.text = "изменили..."
			switcher.setOn(true, animated: true)
		}
	}

	func userDidChangeSegmentControl(label: UILabel?, segmentControl: UISegmentedControl?) {
		if let label = label,
		   let segmentControl = segmentControl
		{
			if segmentControl.selectedSegmentIndex != 2 {
				label.text = segmentControl.titleForSegment(
					at: segmentControl.selectedSegmentIndex)
			} else {
				label.text = "картинка"
			}
		}
	}
	
	func userDidTouchButton(label: UILabel?) -> UIAlertController? {
		if let label = label {
			let actionSheetController = UIAlertController(title: "Выберете!", message: "Отобразится на лейбле", preferredStyle: .actionSheet)
			
			let firstAction = UIAlertAction(title: "Тру", style: .default) { _ in
				label.text = "Вы тру"
			}
			
			let secondAction = UIAlertAction(title: "Не тру", style: .default) { _ in
				label.text = "Вы не тру"
			}
			
			let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
				label.text = "Вы никто!"
			}
			
			actionSheetController.addAction(firstAction)
			actionSheetController.addAction(secondAction)
			actionSheetController.addAction(cancelAction)
			return actionSheetController
		}
		return nil
	}
}
