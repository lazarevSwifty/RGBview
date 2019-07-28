//
//  ViewController.swift
//  RGBview
//
//  Created by Владислав Лазарев on 27/07/2019.
//  Copyright © 2019 Владислав Лазарев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var RGBview: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    var red: CGFloat = 27 / 255
    var green: CGFloat = 173 / 255
    var blue: CGFloat = 112 / 255
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //RGB view setup
        RGBview.layer.cornerRadius = 15
        
        //Sliders logic
        redSlider.addTarget(self, action: #selector(redSliderPull(sender:)), for: .valueChanged)
        greenSlider.addTarget(self, action: #selector(greenSliderPull(sender:)), for: .valueChanged)
        blueSlider.addTarget(self, action: #selector(blueSliderPull(sender:)), for: .valueChanged)
     }
    
    @objc func redSliderPull(sender: UISlider){
        redLabel.text = String(Int(sender.value))
        redTextField.text = String(Int(sender.value))
        
        guard let redInt = NumberFormatter().number(from: redTextField.text!) else { return }
        red = CGFloat(truncating: redInt) / 255
        RGBview.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    @objc func greenSliderPull(sender: UISlider){
        greenLabel.text = String(Int(sender.value))
        greenTextField.text = String(Int(sender.value))
        
        guard let greenInt = NumberFormatter().number(from: greenTextField.text!) else { return }
        green = CGFloat(truncating: greenInt) / 255
        RGBview.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    @objc func blueSliderPull(sender: UISlider){
        blueLabel.text = String(Int(sender.value))
        blueTextField.text = String(Int(sender.value))
        
        guard let blueInt = NumberFormatter().number(from: blueTextField.text!) else { return }
        blue = CGFloat(truncating: blueInt) / 255
        RGBview.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
  

}

