//
//  UILabel.swift
//  Carhelper
//
//  Created by Vladislav  Staryk on 29.01.2023.
//

import UIKit


extension UILabel {
    
    convenience init(text: String, font: UIFont?, alignment: NSTextAlignment = .left) {
        self.init()
    
        
        self.text = text
        self.font = font
        self.textColor = .white
        self.textAlignment = alignment
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
