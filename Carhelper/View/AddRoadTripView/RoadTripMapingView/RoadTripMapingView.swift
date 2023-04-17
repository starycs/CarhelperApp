//
//  RoadTripMapingView.swift
//  Carhelper
//
//  Created by Vladislav  Staryk on 02.02.2023.
//


import Foundation
import UIKit

class RoadTripMapingView: UIView {
    
    @IBOutlet var contentRoadView: UIView!
    
    @IBOutlet weak var fromPlaceButton: UIButton!
    
    @IBOutlet weak var fromPlaceLabel: UILabel!
    @IBOutlet weak var toPlaceLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureRoadButtom()
        configureRoadLabel()
        setupContentView()
    }
 
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
        func setupContentView() {
           Bundle.main.loadNibNamed(String(describing: RoadTripMapingView.self), owner: self, options: nil)
            addSubview(contentRoadView)
            configureRoadLabel()
            configureRoadButtom()
            
           let gradientTop = setupGradientLayerTop()
            contentRoadView.layer.insertSublayer(gradientTop, at: 0)
            
            contentRoadView.layer.cornerRadius = 20
            contentRoadView.backgroundColor = .clear
            contentRoadView.frame = self.bounds
            contentRoadView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
       }

    func configureRoadLabel() {
        
    }
     //   @IBOutlet weak var addSettingsButtonOutlet: UIButton!
        func configureRoadButtom() {
            // fromPlaceButton
            let fromPlaceButton = fromPlaceButton
            fromPlaceButton?.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            fromPlaceButton?.setTitleColor(UIColor.white, for: .normal)

            fromPlaceButton?.layer.cornerRadius = 10
            fromPlaceButton?.layer.shadowColor = UIColor.black.cgColor
            fromPlaceButton?.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            fromPlaceButton?.layer.shadowOpacity = 0.2
            fromPlaceButton?.layer.shadowRadius = 4.0
        
        }
    
    func setupGradientLayerTop() -> CAGradientLayer {
       let gradientLayer = CAGradientLayer()
       let topColor = #colorLiteral(red: 0.3058823529, green: 0.3294117647, blue: 0.3333333333, alpha: 1)
       let bottomColor = #colorLiteral(red: 0.09411764706, green: 0.1215686275, blue: 0.1294117647, alpha: 1)
       gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
       gradientLayer.frame = contentRoadView.bounds
       gradientLayer.cornerRadius = 20
       return gradientLayer
   }
}

