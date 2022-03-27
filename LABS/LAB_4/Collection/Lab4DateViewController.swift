//
//  Lab4DateViewController.swift
//  LABS
//
//  Created by Иван Тазенков on 21.03.2022.
//

import Foundation
import UIKit

class Lab4DateViewController: UIViewController {
    private let titleLabel = UILabel()
    private let datePicker = UIDatePicker()
    private let dateLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Выбор даты"
        setupViews()
        setupTitle()
        setupDatePicker()
        setupDateLabel()
    }

    private func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(datePicker)
        view.addSubview(dateLabel)
        layoutSubviews()
    }

    private func layoutSubviews() {
        titleLabel.frame = CGRect(x: 0,
                                  y: 200,
                                  width: view.frame.width,
                                  height: 20)

        datePicker.frame = CGRect(x: 30,
                                  y: titleLabel.frame.maxY + 50,
                                  width: view.frame.width,
                                  height: 220)
        dateLabel.frame = CGRect(x: 0,
                                 y: datePicker.frame.maxY + 60,
                                 width: view.frame.width,
                                 height: 20)
    }

    private func setupTitle() {
        titleLabel.text = "Выберете дату"
        titleLabel.textAlignment = .center
    }

    private func setupDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.maximumDate = .distantFuture
        datePicker.minimumDate = .distantPast
        datePicker.locale = .current
        datePicker.addTarget(self, action: #selector(dateDidChange), for: .valueChanged)
    }

    private func setupDateLabel() {
        dateLabel.text = "Здесь будет дата"
        dateLabel.textAlignment = .center
    }

    @objc private func dateDidChange() {
        let stringDate: String = datePicker.date.formatted(date: .long, time: .omitted)
        dateLabel.text = stringDate
    }
}
