//
//  PriceSettingView.swift
//  Carhelper
//
//  Created by Vladislav  Staryk on 02.02.2023.
//

import UIKit

class PriceSettingView: UIView {

    @IBOutlet var contentPriceView: UIView!
    
    @IBOutlet weak var pricePopUpButton: UIButton!
    
    @IBOutlet weak var textFieldPrice: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configurePriceLabel()
        setupContentView()
        setPopUpButton()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }

    func setPopUpButton() {
        let optionClosure = {(action : UIAction) in
            print(action.title)}
        
        pricePopUpButton.menu = UIMenu(children: [
            UIAction(title: "USD", state: .on, handler: optionClosure),
            UIAction(title: "EUR", state: .on, handler: optionClosure),
            UIAction(title: "UAH", state: .on, handler: optionClosure)])
        
        pricePopUpButton.showsMenuAsPrimaryAction = true
        pricePopUpButton.changesSelectionAsPrimaryAction = true
    }
  
    func setupContentView() {
       Bundle.main.loadNibNamed(String(describing: PriceSettingView.self), owner: self, options: nil)
        
        addSubview(contentPriceView)
        configurePriceLabel()
        
       let gradientTop = setupGradientLayerTop()
        contentPriceView.layer.insertSublayer(gradientTop, at: 0)
        contentPriceView.layer.cornerRadius = 20
        contentPriceView.backgroundColor = .clear
        contentPriceView.frame = self.bounds
        contentPriceView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
   }

func configurePriceLabel() {
    
}
    
     func setupGradientLayerTop() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        let topColor = #colorLiteral(red: 0.3058823529, green: 0.3294117647, blue: 0.3333333333, alpha: 1)
        let bottomColor = #colorLiteral(red: 0.09411764706, green: 0.1215686275, blue: 0.1294117647, alpha: 1)
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
         gradientLayer.startPoint = CGPoint(x: 0, y: 0)
         gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = contentPriceView.bounds
        gradientLayer.cornerRadius = 20
        return gradientLayer
    }
}


