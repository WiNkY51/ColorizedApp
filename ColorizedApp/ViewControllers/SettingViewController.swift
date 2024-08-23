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
    
    private var redColorIndex: CGFloat = 1
    private var greenColorIndex: CGFloat = 1
    private var blueColorIndex: CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultColorView.layer.cornerRadius = 10
    }

    @IBAction func setRedColor(_ sender: UISlider!) {
        redColorLabel.text = String(format: "%.2f", sender.value)
        redColorIndex = CGFloat(sender.value)
        setColorView()
    }
    
    @IBAction func setGreenColor(_ sender: UISlider!) {
        greenColorLabel.text = String(format: "%.2f",sender.value)
        greenColorIndex = CGFloat(sender.value)
        setColorView()
    }
    
    @IBAction func setBlueColor(_ sender: UISlider!) {
        blueColorLabel.text = String(format: "%.2f", sender.value)
        blueColorIndex = CGFloat(sender.value)
        setColorView()
    }
    
    private func setColorView() {
        resultColorView.backgroundColor = .init(
            red: redColorIndex,
            green: greenColorIndex,
            blue: blueColorIndex,
            alpha: 1
        )
    }
    
}


