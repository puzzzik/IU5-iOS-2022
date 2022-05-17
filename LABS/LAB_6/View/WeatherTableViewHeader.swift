//
//  WeatherTableViewHeader.swift
//  LABS
//
//  Created by Иван Тазенков on 02.04.2022.
//

import Foundation
import UIKit

// MARK: - WeatherTableViewHeader

final class WeatherTableViewHeader: UIView {
    // MARK: Private Properties

    private var action: ((String) -> Void)?
    private let textField = UITextField(frame: .zero)

    // MARK: Private Data Struct

    private enum Constants {
        static let leadingOffset: CGFloat = 35
    }

    // MARK: Internal Data Struct

    struct DisplayData {
        let placeholderText: String
        let action: ((String) -> Void)?
    }

    // MARK: Lifecycle

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
    }

    // MARK: Internal Methods

    func configure(displayData: DisplayData) {
        textField.placeholder = displayData.placeholderText
        action = displayData.action
    }

    // MARK: Private Methods

    private func setupViews() {
        addSubview(textField)
        setupTextField()
    }

    private func setupTextField() {
        textField.delegate = self
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        addConstraints([
            textField.centerYAnchor.constraint(equalTo: centerYAnchor),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.leadingOffset),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.leadingOffset),
        ])
    }
}

// MARK: UITextFieldDelegate

extension WeatherTableViewHeader: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        action?(textField.text ?? "")
        return true
    }
}
