//
//  UIColor+Extensions.swift
//  NutritionFacts
//
//  Created by Ahmad Ragab on 20/11/2022.
//

import UIKit

extension UIColor {
    
    // MARK: - Colors
    static let ingredientTopLeft = #colorLiteral(red: 0.9529411765, green: 0.6549019608, blue: 0.3058823529, alpha: 1)
    static let ingredientBottomRight = #colorLiteral(red: 0.9294117647, green: 0.3294117647, blue: 0.3764705882, alpha: 1)
    static let ingredientGradient = [ingredientTopLeft.cgColor, ingredientBottomRight.cgColor]
    static let moreTopLeft = #colorLiteral(red: 0.003921568627, green: 0.01960784314, blue: 0.1294117647, alpha: 1)
    static let moreBottomRight = #colorLiteral(red: 0.007843137255, green: 0.02352941176, blue: 0.1529411765, alpha: 1)
    static let moreGradient = [moreTopLeft.cgColor, moreBottomRight.cgColor]
    static let ingredientShadow = UIColor(red: 255, green: 102, blue: 92, alpha: 1.0).cgColor
    static let moreShadow = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0).cgColor
}
