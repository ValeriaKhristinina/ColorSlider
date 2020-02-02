//
//  ViewController.swift
//  ColorSlider
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
	
	@IBOutlet var redValue: UITextField!
	@IBOutlet var greenValue: UITextField!
	@IBOutlet var blueValue: UITextField!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		colorView.layer.cornerRadius = 10
		colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1.0)
		
		redValueLabel.text = String(redSlider.value)
		greenValueLabel.text = String(greenSlider.value)
		blueValueLabel.text = String(blueSlider.value)
		
		redValue.text = redValueLabel.text
		greenValue.text = greenValueLabel.text
		blueValue.text = blueValueLabel.text
	}

	@IBAction func redSliderAction() {
		redValueLabel.text = String(round(100*redSlider.value)/100)
		colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1.0)
		redValue.text = String(round(100*redSlider.value)/100)
	}
	
	@IBAction func greenSliderAction() {
		greenValueLabel.text = String(round(100*greenSlider.value)/100)
		colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1.0)
		greenValue.text = String(round(100*greenSlider.value)/100)
	}
	
	@IBAction func blueSliderAction() {
		blueValueLabel.text = String(round(100*blueSlider.value)/100)
		colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1.0)
		blueValue.text = String(round(100*blueSlider.value)/100)
		
	}
	
	@IBAction func changeRedValue() {
		redValueLabel.text = redValue.text
	}
}

