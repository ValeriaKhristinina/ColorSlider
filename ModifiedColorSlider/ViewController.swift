//
//  ViewController.swift
//  ModifiedColorSlider
//
//  Created by Valeria Khristinina on 01/02/2020.
//  Copyright © 2020 Valeria Khristinina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet var colorView: UIView!
	
	@IBOutlet var redValueLabel: UILabel!
	@IBOutlet var greenValueLabel: UILabel!
	@IBOutlet var blueValueLabel: UILabel!
	
	@IBOutlet var redSlider: UISlider!
	@IBOutlet var greenSlider: UISlider!
	@IBOutlet var blueSlider: UISlider!
	
	@IBOutlet var redValueInput: UITextField!
	@IBOutlet var greenValueInput: UITextField!
	@IBOutlet var blueValueInput: UITextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		colorView.layer.cornerRadius = 10
		setColor()
		
		setValue(for: redValueLabel, greenValueLabel, blueValueLabel)
		setValue(for: redValueInput, greenValueInput, blueValueInput)
		
		redValueInput.delegate = self
		greenValueInput.delegate = self
		blueValueInput.delegate = self
		
		addDoneButtonTo(redValueInput, greenValueInput, blueValueInput)
	}

	@IBAction func rbgSlider(_ sender: UISlider) {
		switch sender.tag {
		case 0:
			redValueLabel.text = string(from: sender)
			redValueInput.text = string(from: sender)
		case 1:
			greenValueLabel.text = string(from: sender)
			greenValueInput.text = string(from: sender)
		case 2:
			blueValueLabel.text = string(from: sender)
			blueValueInput.text = string(from: sender)
		default: break
		}
		setColor()
	}
	
	private func setColor() {
		colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
											green: CGFloat(greenSlider.value),
											blue: CGFloat(blueSlider.value),
											alpha: 1.0)
	}
	
	private func setValue(for labels: UILabel ... ) {
		labels.forEach { label in
			switch label.tag {
			case 0: redValueLabel.text = string(from: redSlider)
			case 1: greenValueLabel.text = string(from: greenSlider)
			case 2: blueValueLabel.text = string(from: blueSlider)
			default: break
			}
		}
	}
	
	private func setValue(for textFields: UITextField ... ) {
		textFields.forEach { textField in
			switch textField.tag {
			case 0: redValueInput.text = string(from: redSlider)
			case 1: greenValueInput.text = string(from: greenSlider)
			case 2: blueValueInput.text = string(from: blueSlider)
			default: break
			}
		}
	}
	
	
	private func string(from slider: UISlider) -> String {
		return String(format: "%.2f", slider.value)
	}
}

// MARK: - UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
	
	// Скрываем клавиатуру нажатием на Done
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
	}
	
	// Скрытие клавиатуры по тапу за пределами text field
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesBegan(touches, with: event)
		
		view.endEditing(true) //Скрывает клавиатуру вызванную для любого объекта
	}
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		
		guard let text = textField.text else { return }
		
		if let currentValue = Float(text) {
		  switch textField.tag {
		  case 0:
			  redSlider.setValue(currentValue, animated: true)
			  setValue(for: redValueLabel)
		  case 1:
			greenSlider.setValue(currentValue, animated: true)
			setValue(for: greenValueLabel)
		  case 2:
			blueSlider.setValue(currentValue, animated: true)
			setValue(for: blueValueLabel)
		  default: break
		  }
		}
	}
}

// Метод для отображения кнопки "Done" на клавиатуре

extension ViewController {
	private func addDoneButtonTo(_ textFields: UITextField ...) {
		
		textFields.forEach { textField in
			let toolbar = UIToolbar()
			textField.inputAccessoryView = toolbar
			toolbar.sizeToFit()
			
			let doneButton = UIBarButtonItem(title: "Done",
											 style: .done,
											 target: self,
											 action: #selector(doneButtonAction))
			
			// "Пустая" кнопка. Занимает все пространство до "Done"
			let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
												target: nil,
												action: nil)
			
			toolbar.items = [flexBarButton, doneButton]
		}
	}
	
	@objc func doneButtonAction() {
		view.endEditing(true)
	}
	
}
