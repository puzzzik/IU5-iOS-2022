//
//  DateViewController.swift
//  Lab3Swift
//
//  Created by Иван Тазенков on 17.03.2022.
//

import UIKit

class DateViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var dateLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Выбор даты"
        setupTitle()
        setupDatePicker()
        setupDateLabel()
    }

    private func setupTitle() {
        titleLabel.text = "Выберете дату"
    }

    private func setupDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.maximumDate = .distantFuture
        datePicker.minimumDate = .distantPast
        datePicker.locale = .current
    }

    private func setupDateLabel() {
        dateLabel.text = "Здесь будет дата"
    }

    @IBAction func DateChanged(_ sender: Any) {
        let stringDate: String = datePicker.date.formatted(date: .long, time: .omitted)
        dateLabel.text = stringDate
    }
}
