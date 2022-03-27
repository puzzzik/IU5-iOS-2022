//
//  StuffViewController.swift
//  Lab3Swift
//
//  Created by Иван Тазенков on 15.03.2022.
//

import UIKit
class StuffViewController: UIViewController {
    @IBOutlet var switchLabel: UILabel!
    @IBOutlet var slideLabel: UILabel!
    @IBOutlet var mySwitch: UISwitch!
    @IBOutlet var textFieldLabel: UILabel!
    @IBOutlet var stuffView: UIView!
    @IBOutlet var segmentLabel: UILabel!
    @IBOutlet var buttonLabel: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var textField: UITextField!
    @IBOutlet var segmentPicker: UISegmentedControl!
    @IBOutlet var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Непонятно что"
        setupLables()
        setupSwitch()
        setupSlider()
        setupTextField()
        setupSegmentPicker()
        setupButton()
    }

    private func setupLables() {
        switchLabel.text = "Это выключатель"
        slideLabel.text = "Слайдер"
        textFieldLabel.text = "TextField"
        segmentLabel.text = "Это выбиратель"
        buttonLabel.text = "И... Кнопка!"
    }

    private func setupSwitch() {
        mySwitch.setOn(false, animated: true)
    }

    private func setupSlider() {
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 30
        slider.minimumValueImage = UIImage(systemName: "speaker.wave.1")
        slider.maximumValueImage = UIImage(systemName: "speaker.wave.3")
    }

    private func setupTextField() {
        textField.placeholder = "Введите текст"
        textField.text = "Изначальный текст"
    }

    private func setupSegmentPicker() {
        segmentPicker.setTitle("1", forSegmentAt: 0)
        segmentPicker.setTitle("2", forSegmentAt: 1)
        segmentPicker.setImage(UIImage(systemName: "trash.slash"), forSegmentAt: 2)
    }

    private func setupButton() {
        button.setTitle("Открыть", for: .normal)
    }

    @IBAction func sliderValueDidChange(_ sender: Any) {
        slideLabel.text = "\(Int(slider.value))/100"
    }

    @IBAction func switchDidChange(_ sender: Any) {
        if mySwitch.isOn {
            switchLabel.text = "вкл"
        } else {
            switchLabel.text = "выкл"
        }
    }

    @IBAction func segmentPickerValueDidChange(_ sender: Any) {
        if segmentPicker.selectedSegmentIndex != 2 {
            segmentLabel.text = segmentPicker.titleForSegment(at: segmentPicker.selectedSegmentIndex)
        } else {
            segmentLabel.text = "картинка"
        }
    }

    @IBAction func textFieldDidChange(_ sender: Any) {
        textFieldLabel.text = "изменили..."
    }

    @IBAction func buttonTapped(_ sender: Any) {
        let actionSheetController = UIAlertController(title: "Выберете!", message: "Отобразится на лейбле", preferredStyle: .actionSheet)

        let firstAction = UIAlertAction(title: "Тру", style: .default) { [unowned self] _ in
            buttonLabel.text = "Вы тру"
        }

        let secondAction = UIAlertAction(title: "Не тру", style: .default) { [unowned self] _ in
            buttonLabel.text = "Вы не тру"
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { [unowned self] _ in
            buttonLabel.text = "Вы никто!"
        }

        actionSheetController.addAction(firstAction)
        actionSheetController.addAction(secondAction)
        actionSheetController.addAction(cancelAction)
        present(actionSheetController, animated: true, completion: nil)
    }
}
