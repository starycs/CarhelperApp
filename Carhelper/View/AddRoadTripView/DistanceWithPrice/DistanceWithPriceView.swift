//
//  DistanceWithPriceView.swift
//  Carhelper
//
//  Created by Vladislav  Staryk on 02.02.2023.
//

import UIKit

class DistanceWithPriceView: UIView {
    
    let map = MapViewController()
    
    @IBOutlet var contentDistanceView: UIView!
    
    @IBOutlet weak var totaldistance: UILabel!
    
    @IBOutlet weak var addDistanceButton: UIButton!
    
    @IBOutlet weak var totalPrice: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContentView()
        
        totaldistance.text = "0000 km"
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    
    func setupContentView() {
        Bundle.main.loadNibNamed(String(describing: DistanceWithPriceView.self), owner: self, options: nil)
        
        adButon()
        addSubview(contentDistanceView)
        let gradientTop = setupGradientLayerDistance()
        contentDistanceView.layer.insertSublayer(gradientTop, at: 0)
        contentDistanceView.layer.cornerRadius = 20
        contentDistanceView.backgroundColor = .clear
        contentDistanceView.frame = self.bounds
        contentDistanceView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    func adButon() {
        let buton = addDistanceButton
        buton?.addTarget(self, action: #selector(adDistance), for: .touchUpInside)
    }
    
    @objc fileprivate func adDistance(){
        print("tap")
    }
    
     func setupGradientLayerDistance() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        let topColor = #colorLiteral(red: 0.3058823529, green: 0.3294117647, blue: 0.3333333333, alpha: 1)
        let bottomColor = #colorLiteral(red: 0.09411764706, green: 0.1215686275, blue: 0.1294117647, alpha: 1)
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
         gradientLayer.startPoint = CGPoint(x: 0, y: 0)
         gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = contentDistanceView.bounds
        gradientLayer.cornerRadius = 20
        return gradientLayer
    }

}
