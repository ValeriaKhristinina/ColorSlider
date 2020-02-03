//
//  ViewController.swift
//  ColorSlider
//
//  Created by Valeria Khristinina on 01/02/2020.
//  Copyright © 2020 Valeria Khristinina. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
	
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
		colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1.0)
		
		redValueLabel.text = String(redSlider.value)
		greenValueLabel.text = String(greenSlider.value)
		blueValueLabel.text = String(blueSlider.value)
		
		redValueInput.delegate = self
		greenValueInput.delegate = self
		blueValueInput.delegate = self
		redValueInput.text = redValueLabel.text
		greenValueInput.text = greenValueLabel.text
		blueValueInput.text = blueValueLabel.text
		
		setupTextFields()
	}
	
	
	func changeColorView() {
		colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1.0)
	}
	
	func colorValueToString(color: Float) -> String {
		return String(round(100*color)/100)
	}


	@IBAction func redSliderAction() {
		let value = colorValueToString(color: redSlider.value)
		redValueLabel.text = value
		redValueInput.text = value
		changeColorView()
	}
	
	@IBAction func greenSliderAction() {
		let value = colorValueToString(color: greenSlider.value)
		greenValueLabel.text = value
		greenValueInput.text = value
		changeColorView()
	}
	
	@IBAction func blueSliderAction() {
		let value = colorValueToString(color: blueSlider.value)
		blueValueLabel.text = value
		blueValueInput.text = value
		changeColorView()
	}
	
	func changeColor() {
		redValueLabel.text = redValueInput.text
		greenValueLabel.text = greenValueInput.text
		blueValueLabel.text = blueValueInput.text
		
		let floatRedValueInput = (redValueInput.text! as NSString).floatValue
		let floatGreenValueInput = (greenValueInput.text! as NSString).floatValue
		let floatBlueValueInput = (blueValueInput.text! as NSString).floatValue
		
		redSlider.value = floatRedValueInput
		greenSlider.value = floatGreenValueInput
		blueSlider.value = floatBlueValueInput
		
		changeColorView()
	}
		
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		changeColor()
		return true
	}
	
	func setupTextFields() {
		let toolbar = UIToolbar()
		let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(doneButtonAction))
		
		toolbar.setItems([doneButton], animated: false)
		toolbar.sizeToFit()
		
		redValueInput.inputAccessoryView = toolbar
		greenValueInput.inputAccessoryView = toolbar
		blueValueInput.inputAccessoryView = toolbar
	}
	
	@objc func doneButtonAction() {
		changeColor()
		self.view.endEditing(true)
	}
	
}
