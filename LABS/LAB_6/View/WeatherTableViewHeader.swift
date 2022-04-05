//
//  WeatherTableViewHeader.swift
//  LABS
//
//  Created by Иван Тазенков on 02.04.2022.
//

import Foundation
import UIKit

// MARK: - WeatherTableViewHeader

final class WeatherTableViewHeader: UITableViewHeaderFooterView {
	private let textField = UITextField()
	
	private enum Constants {
		enum textField {
			static let x: CGFloat = 35
			static let y: CGFloat = 10
			static let width: CGFloat = 70
			static let height: CGFloat = 30
		}
	}

	override init(reuseIdentifier: String?) {
		super.init(reuseIdentifier: reuseIdentifier)
		setupViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setupViews()
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		textField.frame = CGRect(x: Constants.textField.x,
		                         y: Constants.textField.y,
		                         width: contentView.frame.width - Constants.textField.width,
		                         height: Constants.textField.height)
	}
	
	private func setupViews() {
		contentView.addSubview(textField)
		setupTextField()
	}
	
	private func setupTextField() {
		textField.delegate = self
		textField.borderStyle = .roundedRect
		textField.textAlignment = .center
		textField.center = contentView.center
		textField.placeholder = "Введите город"
	}
}

// MARK: UITextFieldDelegate

extension WeatherTableViewHeader: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		NotificationCenter.default.post(name: NSNotification.Name("textFieldDidEditingEnd"),
		                                object: textField.text)
		return true
	}
}
