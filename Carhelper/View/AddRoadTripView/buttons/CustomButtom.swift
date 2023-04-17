//
//  CustomButtom.swift
//  Carhelper
//
//  Created by Vladislav  Staryk on 03.02.2023.
//

import Foundation
import UIKit

class CustomButtonRoad: UIView {
        
        let stackView = UIStackView()
        let Road = UIButton()
        let Rest = UIButton()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupView()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupView()
        }
        
        private func setupView() {
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .horizontal
            stackView.spacing = 5
            stackView.distribution = .fillEqually
            stackView.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
            
            Road.setTitle("Road", for: .normal)
            Road.layer.cornerRadius = 15
            Road.backgroundColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
            
            Rest.setTitle("Reset", for: .normal)
            Rest.layer.cornerRadius = 15
            Rest.backgroundColor = #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
            
            stackView.addArrangedSubview(Road)
            stackView.addArrangedSubview(Rest)
            
            addSubview(stackView)
        }
    }

