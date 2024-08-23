//
//  SettingViewController.swift
//  ColorizedApp
//
//  Created by Winky51 on 20.08.2024.
//

import UIKit

protocol SettingViewControllerDelegate: AnyObject {
    func updateColor(_ newColor: UserColor)
}

final class MainViewController: UIViewController {

    private var color = UserColor.getColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        setBackgroundColor(color)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationVC = segue.destination as? UINavigationController
        let settingVC = navigationVC?.topViewController as? SettingViewController
        
        settingVC?.newBackgroundColor = color
        settingVC?.delegate = self
    }


}
//MARK: - MainVC methods
extension MainViewController {
    func setBackgroundColor(_ color: UserColor) {
        view.backgroundColor = UIColor(
            red: CGFloat(color.red),
            green: CGFloat(color.green),
            blue: CGFloat(color.blue),
            alpha: 1
        )
      
    }
}
//MARK: - SettingVCDelegate
extension MainViewController: SettingViewControllerDelegate {
    func updateColor(_ newColor: UserColor) {
        color.red = newColor.red
        color.green = newColor.green
        color.blue = newColor.blue
        
        setBackgroundColor(color)
        
    }
    
    
}
