//
//  ButtonCardViewInfo.swift
//  Carhelper
//
//  Created by Vladislav  Staryk on 30.01.2023.
//

import UIKit
class ButtonCardViewInfo: UIView {
    
        let button1 = UIButton(type: .system)
        let button2 = UIButton(type: .system)
    
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 320, height: 100))
        self.backgroundColor = .clear
        setupButtons()
        
        //Gradients
        let gradient = setupGradientLayer()
        self.layer.insertSublayer(gradient, at: 0)
        let gradientButton1 = setupGradientLayerBottomsA()
        button1.layer.insertSublayer(gradientButton1, at: 0)
        let gradientButton2 = setupGradientLayerBottomsA()
        button2.layer.insertSublayer(gradientButton2, at: 0)
        
        button2.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
        
    }
    @objc func button1Tapped() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //GradientsSettings
    func setupGradientLayerBottomsA() -> CAGradientLayer {
       let gradientLayer = CAGradientLayer()
       let topColor = #colorLiteral(red: 0.4756369591, green: 0.4756369591, blue: 0.4756369591, alpha: 1)
       let bottomColor = #colorLiteral(red: 0.09411764706, green: 0.1215686275, blue: 0.1294117647, alpha: 1)
       gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
       gradientLayer.startPoint = CGPoint(x: 0, y: 0)
       gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = button1.bounds
       gradientLayer.cornerRadius = 20
       return gradientLayer
   }

    func setupButtons() {
        let dataC = TaskModel().taskName.last
     
        //Buttoms 1 setings
        button1.frame = CGRect(x: 10, y: 10, width: 120, height: 80)
        button1.setTitle("last", for: .normal)
        button1.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button1.setTitleColor(UIColor.white, for: .normal)
        button1.setTitleColor(UIColor.red, for: .highlighted)
        button1.tintColor = .white
        button1.setTitleColor(.red, for: .selected)
        button1.layer.cornerRadius = 5
        button1.backgroundColor = .clear
        button1.layer.shadowColor = UIColor.black.cgColor
        button1.layer.shadowOpacity = 0.5
        button1.layer.shadowOffset = CGSize.zero
        button1.layer.shadowRadius = 5
      
        self.addSubview(button1)
        
        //Buttoms 2 settings
        button2.frame = CGRect(x: 190, y:10, width: 120, height: 80)
        button2.setTitle("Add Road\n     Trip", for: .normal)
        button2.setTitleColor(UIColor.white, for: .normal)
        button2.setTitleColor(UIColor.red, for: .highlighted)
        button2.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button2.titleLabel?.numberOfLines = 0
        button2.tintColor = .white
        button2.layer.cornerRadius = 5
        button2.backgroundColor = .clear
        button2.layer.shadowColor = UIColor.black.cgColor
        button2.layer.shadowOpacity = 0.5
        button2.layer.shadowOffset = CGSize.zero
        button2.layer.shadowRadius = 5
        self.addSubview(button2)
    }
}
