//
//  Lab4StuffViewController.swift
//  LABS
//
//  Created by Иван Тазенков on 21.03.2022.
//

import UIKit

class Lab4StuffViewController: UIViewController {
    private let mySwitch = UISwitch(frame: .zero)
    private let slider = UISlider(frame: .zero)
    private let textField = UITextField(frame: .zero)
    private let segmentControl = UISegmentedControl(frame: .zero)
    private let actionButton = UIButton(frame: .zero)

    private let mySwitchLabel = UILabel(frame: .zero)
    private let sliderLabel = UILabel(frame: .zero)
    private let textFieldLabel = UILabel(frame: .zero)
    private let segmentControlLabel = UILabel(frame: .zero)
    private let actionButtonLabel = UILabel(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Непонятно что"
        setupViews()
        setupLabels()
        setupActionButton()
        setupMySwitch()
        setupTextField()
        setupSegmentControl()
        setupSlider()
        setupConstraints()
    }

    private func setupViews() {
        view.addSubview(mySwitch)
        view.addSubview(slider)
        view.addSubview(textField)
        view.addSubview(segmentControl)
        view.addSubview(actionButton)
        view.addSubview(mySwitchLabel)
        view.addSubview(sliderLabel)
        view.addSubview(textFieldLabel)
        view.addSubview(segmentControlLabel)
        view.addSubview(actionButtonLabel)
    }

    private func setupLabels() {
        mySwitchLabel.text = "Это выключатель"
        sliderLabel.text = "Слайдер"
        textFieldLabel.text = "TextField"
        segmentControlLabel.text = "Это выбиратель"
        actionButtonLabel.text = "И... Кнопка!"
    }

    private func setupConstraints() {
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        slider.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        mySwitchLabel.translatesAutoresizingMaskIntoConstraints = false
        sliderLabel.translatesAutoresizingMaskIntoConstraints = false
        textFieldLabel.translatesAutoresizingMaskIntoConstraints = false
        segmentControlLabel.translatesAutoresizingMaskIntoConstraints = false
        actionButtonLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            mySwitchLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 125),
            mySwitchLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            mySwitchLabel.bottomAnchor.constraint(equalTo: sliderLabel.topAnchor, constant: -40),
            mySwitch.leadingAnchor.constraint(lessThanOrEqualTo: mySwitchLabel.trailingAnchor, constant: 200),
            mySwitch.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 125),
            mySwitch.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            mySwitch.bottomAnchor.constraint(equalTo: slider.topAnchor, constant: -35),

            sliderLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            sliderLabel.bottomAnchor.constraint(equalTo: textFieldLabel.topAnchor, constant: -40),
            sliderLabel.centerYAnchor.constraint(equalTo: slider.centerYAnchor),
            slider.leadingAnchor.constraint(lessThanOrEqualTo: sliderLabel.trailingAnchor, constant: 70),
            slider.trailingAnchor.constraint(equalTo: mySwitch.trailingAnchor, constant: 10),
            slider.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -30),
            slider.widthAnchor.constraint(equalToConstant: 210),

            textFieldLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldLabel.bottomAnchor.constraint(equalTo: segmentControlLabel.topAnchor, constant: -45),
            textField.leadingAnchor.constraint(lessThanOrEqualTo: textFieldLabel.trailingAnchor, constant: 70),
            textField.centerYAnchor.constraint(equalTo: textFieldLabel.centerYAnchor),
            textField.trailingAnchor.constraint(equalTo: slider.trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: segmentControl.topAnchor, constant: -30),
            textField.widthAnchor.constraint(equalToConstant: 210),

            segmentControlLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            segmentControlLabel.bottomAnchor.constraint(equalTo: actionButtonLabel.topAnchor, constant: -40),
            segmentControl.centerYAnchor.constraint(equalTo: segmentControlLabel.centerYAnchor),
            segmentControl.leadingAnchor.constraint(lessThanOrEqualTo: segmentControlLabel.trailingAnchor, constant: 70),
            segmentControl.trailingAnchor.constraint(equalTo: slider.trailingAnchor),
            segmentControl.widthAnchor.constraint(equalToConstant: 210),
            segmentControl.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -30),

            actionButtonLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            //actionButton.leadingAnchor.constraint(lessThanOrEqualTo: actionButtonLabel.trailingAnchor, constant: 90),
            actionButton.trailingAnchor.constraint(equalTo: segmentControl.trailingAnchor),
            actionButton.widthAnchor.constraint(equalToConstant: 90)
        ])
    }

    private func setupActionButton() {
        actionButton.setTitle("Открыть", for: .normal)
        actionButton.backgroundColor = .systemBlue
        actionButton.addTarget(self, action: #selector(didTouchButton), for: .touchUpInside)
    }

    private func setupMySwitch() {
        mySwitch.isOn = false
        mySwitch.preferredStyle = .sliding
        mySwitch.addTarget(self, action: #selector(didChangeSwitch), for: .valueChanged)
    }

    private func setupTextField() {
        textField.placeholder = "Введите текст"
        textField.text = "Изначальный текст"
        textField.clearsOnBeginEditing = true
        textField.borderStyle = .roundedRect
        textField.addTarget(self, action: #selector(didChangeTextField), for: .allEditingEvents)
    }

    private func setupSegmentControl() {
        segmentControl.insertSegment(withTitle: "a", at: 0, animated: true)
        segmentControl.insertSegment(withTitle: "b", at: 1, animated: true)
        segmentControl.insertSegment(with: UIImage(systemName: "trash.slash"), at: 2, animated: true)
        segmentControl.addTarget(self, action: #selector(didChangeSegmentControl), for: .valueChanged)
    }

    private func setupSlider() {
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 30
        slider.minimumValueImage = UIImage(systemName: "speaker.wave.1")
        slider.maximumValueImage = UIImage(systemName: "speaker.wave.3")
        slider.addTarget(self, action: #selector(didChangeSlider), for: .valueChanged)
    }

    @objc private func didChangeSwitch() {
        if mySwitch.isOn {
            mySwitchLabel.text = "вкл"
        } else {
            textField.resignFirstResponder()
            mySwitchLabel.text = "выкл"
        }
    }

    @objc private func didChangeSlider() {
        sliderLabel.text = "\(Int(slider.value))/100"
    }

    @objc private func didChangeTextField() {
        textFieldLabel.text = "изменили..."
        mySwitch.setOn(true, animated: true)
    }

    @objc private func didChangeSegmentControl() {
        if segmentControl.selectedSegmentIndex != 2 {
            segmentControlLabel.text = segmentControl.titleForSegment(
                at: segmentControl.selectedSegmentIndex)
        } else {
            segmentControlLabel.text = "картинка"
        }
    }

    @objc private func didTouchButton() {
        let actionSheetController = UIAlertController(title: "Выберете!", message: "Отобразится на лейбле", preferredStyle: .actionSheet)

                let firstAction = UIAlertAction(title: "Тру", style: .default) { [unowned self] _ in
                    actionButtonLabel.text = "Вы тру"
                }

                let secondAction = UIAlertAction(title: "Не тру", style: .default) { [unowned self] _ in
                    actionButtonLabel.text = "Вы не тру"
                }

                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { [unowned self] _ in
                    actionButtonLabel.text = "Вы никто!"
                }

                actionSheetController.addAction(firstAction)
                actionSheetController.addAction(secondAction)
                actionSheetController.addAction(cancelAction)
                present(actionSheetController, animated: true, completion: nil)
    }
}
