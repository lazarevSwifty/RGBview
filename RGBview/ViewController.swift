//
//  ViewController.swift
//  RGBview
//
//  Created by Владислав Лазарев on 27/07/2019.
//  Copyright © 2019 Владислав Лазарев. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

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
        
        addToolBar(textField: redTextField)
        addToolBar(textField: greenTextField)
        addToolBar(textField: blueTextField)
        //Sliders logic
        redSlider.addTarget(self, action: #selector(redSliderPull(sender:)), for: .valueChanged)
        greenSlider.addTarget(self, action: #selector(greenSliderPull(sender:)), for: .valueChanged)
        blueSlider.addTarget(self, action: #selector(blueSliderPull(sender:)), for: .valueChanged)
     }
    
    // pull red slider
    @objc func redSliderPull(sender: UISlider){
        redLabel.text = String(Int(sender.value))
        redTextField.text = String(Int(sender.value))
        
        guard let redInt = NumberFormatter().number(from: redTextField.text!) else { return }
        red = CGFloat(truncating: redInt) / 255
        RGBview.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    // pull green slider
    @objc func greenSliderPull(sender: UISlider){
        greenLabel.text = String(Int(sender.value))
        greenTextField.text = String(Int(sender.value))
        
        guard let greenInt = NumberFormatter().number(from: greenTextField.text!) else { return }
        green = CGFloat(truncating: greenInt) / 255
        RGBview.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    // pull blue slider
    @objc func blueSliderPull(sender: UISlider){
        blueLabel.text = String(Int(sender.value))
        blueTextField.text = String(Int(sender.value))
        
        guard let blueInt = NumberFormatter().number(from: blueTextField.text!) else { return }
        blue = CGFloat(truncating: blueInt) / 255
        RGBview.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
  
    //ADD TOOLBAR
    func addToolBar(textField: UITextField){
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = .black
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: Selector(("donePressed")))
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        textField.delegate = self
        textField.inputAccessoryView = toolBar
        
    }
    @objc func donePressed(){
        view.endEditing(true)
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        guard let numColor = NumberFormatter().number(from: textField.text!) else { return false }
        if Int(truncating: numColor) > 0 && Int(truncating: numColor) <= 255 {
            return true
        } else {
            alert(message: "Введите значение от 0 до 255", title: "Ошибка")
            return false
        }
    }
    

    
   
    func textFieldDidEndEditing(_ textField: UITextField) {
             guard let colorNum = NumberFormatter().number(from: textField.text!) else { return }
             switch textField.tag {
             case 1:
                 redSlider.value = Float(truncating: colorNum)
                 redLabel.text = String(Int(truncating: colorNum))
                 red = CGFloat(truncating: colorNum) / 255
                 RGBview.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
             case 2:
                greenSlider.value = Float(truncating: colorNum)
                greenLabel.text = String(Int(truncating: colorNum))
                green = CGFloat(truncating: colorNum) / 255
                RGBview.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
             case 3:
                blueSlider.value = Float(truncating: colorNum)
                blueLabel.text = String(Int(truncating: colorNum))
                blue = CGFloat(truncating: colorNum) / 255
                RGBview.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
             default:
                 break
             }
    }

}

extension UIViewController {
    
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
