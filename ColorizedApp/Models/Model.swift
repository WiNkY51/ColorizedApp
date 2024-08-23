//
//  Model.swift
//  ColorizedApp
//
//  Created by Winky51 on 21.08.2024.
//

struct UserColor {
    var red: Float
    var green: Float
    var blue: Float
    
    static func getColor() -> UserColor {
        UserColor(
            red: 0,
            green: 0,
            blue: 0
        )
    }
}
