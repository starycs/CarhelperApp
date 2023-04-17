//
//  ColorGradient.swift
//  Carhelper
//
//  Created by Vladislav  Staryk on 29.01.2023.
//

import UIKit

extension UIView {
    
     func setupGradientLayer() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        let topColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        let bottomColor = #colorLiteral(red: 0.09411764706, green: 0.1215686275, blue: 0.1294117647, alpha: 1)
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = 20
        return gradientLayer
    }
    
    func setupGradientLayerBottoms() -> CAGradientLayer {
       let gradientLayer = CAGradientLayer()
       let topColor = #colorLiteral(red: 0.4756369591, green: 0.4756369591, blue: 0.4756369591, alpha: 1)
       let bottomColor = #colorLiteral(red: 0.09411764706, green: 0.1215686275, blue: 0.1294117647, alpha: 1)
       gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
       gradientLayer.startPoint = CGPoint(x: 0, y: 0)
       gradientLayer.endPoint = CGPoint(x: 1, y: 1)
       gradientLayer.frame = bounds
       gradientLayer.cornerRadius = 20
       return gradientLayer
   }
    
    
}
