//
//  CurrentView.swift
//  Carhelper
//
//  Created by Vladislav  Staryk on 12.02.2023.
//

import Foundation
import UIKit
import RealmSwift

class CurrentView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var fuelPerOneHundred: UILabel!
    
    @IBOutlet weak var carImage: UIImageView!
    
    
    let localRealm = try! Realm()
    var carArray: Results<CarModel>!
    var dataImage: Data?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContentView()
        
        if let carModel = localRealm.objects(CarModel.self).first {
            configure(model: carModel)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(model: CarModel) {

        modelLabel.text = model.carModel
        fuelPerOneHundred.text = model.carFuelPerOneH
        carImage.image = UIImage(data: model.carImage ?? Data())

    }
    
    func setupContentView() {
        Bundle.main.loadNibNamed(String(describing: CurrentView.self), owner: self, options: nil)
      addSubview(contentView)
        
        let gradientTop = setupGradientLayerTop()
        contentView.layer.insertSublayer(gradientTop, at: 0)
        
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor = .clear
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
   }
    func setupGradientLayerTop() -> CAGradientLayer {
       let gradientLayer = CAGradientLayer()
       let topColor = #colorLiteral(red: 0.3058823529, green: 0.3294117647, blue: 0.3333333333, alpha: 1)
       let bottomColor = #colorLiteral(red: 0.09411764706, green: 0.1215686275, blue: 0.1294117647, alpha: 1)
       gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
       gradientLayer.frame = contentView.bounds
       gradientLayer.cornerRadius = 20
       return gradientLayer

   }
}
