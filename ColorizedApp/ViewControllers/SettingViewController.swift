//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Winky51 on 15.07.2024.
//

import UIKit

final class SettingViewController: UIViewController {
    
    @IBOutlet var resultColorView: UIView!
    
    @IBOutlet var redColorLabel: UILabel!
    @IBOutlet var greenColorLabel: UILabel!
    @IBOutlet var blueColorLabel: UILabel!
    
    @IBOutlet var redColorTF: UITextField!
    @IBOutlet var greenColorTF: UITextField!
    @IBOutlet var blueColorTF: UITextField!
    
    @IBOutlet var colorSliders: [UISlider]!
    
    weak var delegate: (SettingViewControllerDelegate)?
    var newBackgroundColor: UserColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redColorTF.delegate = self
        greenColorTF.delegate = self
        blueColorTF.delegate = self
        
        resultColorView.layer.cornerRadius = 20
        
        setup(newBackgroundColor)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    @IBAction func editColor(_ sender: UISlider!) {
        guard let sliderIndex = colorSliders.firstIndex(of: sender) else { return }
        let sliderTag = colorSliders[sliderIndex].tag
        switch sliderTag{
        case 0:
            newBackgroundColor.red = sender.value
            redColorLabel.text = String(format: "%.2f", newBackgroundColor.red)
            redColorTF.text = String(format: "%.2f", newBackgroundColor.red)
            updateBackgroundColor()
            
        case 1:
            newBackgroundColor.green = sender.value
            greenColorLabel.text = String(format: "%.2f", newBackgroundColor.green)
            greenColorTF.text = String(format: "%.2f", newBackgroundColor.green)
            updateBackgroundColor()
            
        default:
            newBackgroundColor.blue = sender.value
            blueColorLabel.text = String(format: "%.2f", newBackgroundColor.blue)
            blueColorTF.text = String(format: "%.2f", newBackgroundColor.blue)
            updateBackgroundColor()
        }
        
    }
    @IBAction func saveButtonAction() {
        view.endEditing(true)
        delegate?.updateColor(newBackgroundColor)
        dismiss(animated: true)
    }
    
    @IBAction func backButtonAction() {
        dismiss(animated: true)
        
    }
}

//MARK: - Private methods
private extension SettingViewController {
    func updateBackgroundColor() {
        resultColorView.backgroundColor = UIColor(
            red: CGFloat(newBackgroundColor.red),
            green: CGFloat(newBackgroundColor.green),
            blue: CGFloat(newBackgroundColor.blue),
            alpha: 1
        )
    }
    
    func setup(_ color: UserColor) {
    
        colorSliders.forEach { slider in
            switch slider.tag {
            case 0:
                slider.value = color.red
                redColorTF.text = String(format: "%.2f", newBackgroundColor.red)
                redColorLabel.text = String(format: "%.2f", newBackgroundColor.red)
            case 1:
                slider.value = color.green
                greenColorTF.text = String(format: "%.2f", newBackgroundColor.green)
                greenColorLabel.text = String(format: "%.2f", newBackgroundColor.green)
            default:
                slider.value = color.blue
                blueColorTF.text = String(format: "%.2f", newBackgroundColor.blue)
                blueColorLabel.text = String(format: "%.2f", newBackgroundColor.blue)
            }
            
            updateBackgroundColor()
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Не ккоректные данные", message: "Введите значение от 0 до 1.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}
//MARK: - UITextFieldDelegate
extension SettingViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newColor = textField.text, let validColor = Float(newColor), validColor >= 0, validColor <= 1 else {
            showAlert()
            return
        }
        
        switch textField {
        case redColorTF:
            newBackgroundColor.red = validColor
        case greenColorTF:
            newBackgroundColor.green = validColor
        default:
            newBackgroundColor.blue = validColor
        }
        
        setup(newBackgroundColor)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
    }
    
}


