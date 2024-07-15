//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Winky51 on 15.07.2024.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet var redColorLabel: UILabel!
    @IBOutlet var greenColorLabel: UILabel!
    @IBOutlet var blueColorLabel: UILabel!
    
    private var redColorIndex: CGFloat = 1
    private var greenColorIndex: CGFloat = 1
    private var blueColorIndex: CGFloat = 1

    @IBAction func setRedColor(_ sender: UISlider!) {
        redColorLabel.text = sender.value.formatted()
        redColorIndex = CGFloat(sender.value)
        setColorView()
    }
    
    @IBAction func setGreenColor(_ sender: UISlider!) {
        greenColorLabel.text = sender.value.formatted()
        greenColorIndex = CGFloat(sender.value)
        setColorView()
    }
    
    @IBAction func setBlueColor(_ sender: UISlider!) {
        blueColorLabel.text = sender.value.formatted()
        blueColorIndex = CGFloat(sender.value)
        setColorView()
    }
    
    private func setColorView() {
        view.backgroundColor = .init(red: redColorIndex, green: greenColorIndex, blue: blueColorIndex, alpha: 1)
    }
    
}


