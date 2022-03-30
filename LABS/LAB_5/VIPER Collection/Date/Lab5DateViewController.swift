//
//  Lab5DateViewController.swift
//  LABS
//
//  Created by Иван Тазенков on 30.03.2022.
//
import Foundation
import UIKit

class Lab5DateViewController: UIViewController {
	private let titleLabel = UILabel()
	private let datePicker = UIDatePicker()
	private let dateLabel = UILabel()
	
	private enum Constants {
		enum titleFrame {
			static let x: CGFloat = 0
			static let y: CGFloat = 200
			static let height: CGFloat = 20
		}
		enum datePickerFrame {
			static let x: CGFloat = 30
			static let height: CGFloat = 220
		}
		enum dateLabelFrame {
			static let x: CGFloat = 0
			static let height: CGFloat = 20
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Выбор даты"
		setupViews()
		setupTitle()
		setupDatePicker()
		setupDateLabel()
		view.backgroundColor = .systemBackground
	}
	
	private func setupViews() {
		view.addSubview(titleLabel)
		view.addSubview(datePicker)
		view.addSubview(dateLabel)
		layoutSubviews()
	}
	
	private func layoutSubviews() {
		titleLabel.frame = CGRect(x: Constants.titleFrame.x,
								  y: Constants.titleFrame.y,
								  width: view.frame.width,
								  height: Constants.titleFrame.height)
		
		datePicker.frame = CGRect(x: Constants.datePickerFrame.x,
								  y: titleLabel.frame.maxY + 50,
								  width: view.frame.width,
								  height: Constants.datePickerFrame.height)
		dateLabel.frame = CGRect(x: Constants.dateLabelFrame.x,
								 y: datePicker.frame.maxY + 60,
								 width: view.frame.width,
								 height: Constants.dateLabelFrame.height)
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
