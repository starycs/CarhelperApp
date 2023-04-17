//
//  CarTopCard.swift
//  Carhelper
//
//  Created by Vladislav  Staryk on 31.01.2023.
//

import Foundation
import UIKit
import RealmSwift

class CarTopCard: UIView {
    
    @IBOutlet var contentTopCardView: UIView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var modelCarLabel: UILabel!
    @IBOutlet weak var engineTypeLabel: UILabel!

    @IBOutlet weak var fuelPerOneHundredLabel: UILabel!
    @IBOutlet weak var carMileageLabel: UILabel!
    
    @IBOutlet weak var colorButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    
    @IBOutlet weak var carImageView: UIImageView!
    
    let localRealm = try! Realm()
    var carArray: Results<CarModel>!
    var dataImage: Data?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
 
        configureButtom()
        configureLabel()
        setupContentView()
       
        
        if let carModel = localRealm.objects(CarModel.self).first {
            configure(model: carModel)
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
 
        configureButtom()
        configureLabel()
        setupContentView()
    }

    func configure(model: CarModel) {
        
        userNameLabel.text = model.carProfileName
        modelCarLabel.text = model.carModel
        engineTypeLabel.text = model.carType
        fuelPerOneHundredLabel.text = model.carFuelPerOneH
        carMileageLabel.text = model.carMileage
        settingsButton.backgroundColor = UIColor().colorFromHex("\(model.carColor)")
        carImageView.image = UIImage(data: model.carImage ?? Data())
    }

    func setupContentView() {
       Bundle.main.loadNibNamed(String(describing: CarTopCard.self), owner: self, options: nil)
        addSubview(contentTopCardView)

       configureLabel()
       configureButtom()
        
       let gradientTop = setupGradientLayerTop()
       contentTopCardView.layer.insertSublayer(gradientTop, at: 0)
        
       contentTopCardView.layer.cornerRadius = 20
       contentTopCardView.backgroundColor = .clear
       contentTopCardView.frame = self.bounds
       contentTopCardView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
   }

    func configureLabel() {
        let modelCar = modelCarLabel
        modelCar?.text = "Model"
        modelCar?.font = .systemFont(ofSize: 12)
        modelCar?.textColor = .white
        
        let engineTypeCar = engineTypeLabel
        engineTypeCar?.text = "Type"
        engineTypeCar?.font = .systemFont(ofSize: 12)
        engineTypeCar?.textColor = .white
    }
    
 //   @IBOutlet weak var addSettingsButtonOutlet: UIButton!
    func configureButtom() {
        //setting button
        let settingsButton = settingsButton
        settingsButton?.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        settingsButton?.tintColor = .white
        settingsButton?.setTitle("", for: .normal)
        settingsButton?.setTitleColor(UIColor.white, for: .normal)
        
        settingsButton?.layer.cornerRadius = 10
        settingsButton?.layer.shadowColor = UIColor.black.cgColor
        settingsButton?.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        settingsButton?.layer.shadowOpacity = 0.2
        settingsButton?.layer.shadowRadius = 4.0
        
        //colorButton
        let colorButtom = colorButton
        colorButtom?.backgroundColor = #colorLiteral(red: 0.09411764706, green: 0.1215686275, blue: 0.1294117647, alpha: 1)
        colorButtom?.tintColor = .white
        colorButtom?.titleLabel?.text = "settings"
        colorButtom?.titleLabel?.font = UIFont(name: "Avenir Demi", size: 12)
        colorButtom?.setTitleColor(UIColor.white, for: .normal)
        
        colorButtom?.layer.cornerRadius = 10
        colorButtom?.layer.shadowColor = UIColor.black.cgColor
        colorButtom?.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        colorButtom?.layer.shadowOpacity = 0.2
        colorButtom?.layer.shadowRadius = 4.0
        //colorButtom?.addTarget(self, action: #selector(tapSettings), for: .touchUpInside)
    }

     func setupGradientLayerTop() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        let topColor = #colorLiteral(red: 0.3058823529, green: 0.3294117647, blue: 0.3333333333, alpha: 1)
        let bottomColor = #colorLiteral(red: 0.09411764706, green: 0.1215686275, blue: 0.1294117647, alpha: 1)
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
         gradientLayer.startPoint = CGPoint(x: 0, y: 0)
         gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = contentTopCardView.bounds
        gradientLayer.cornerRadius = 20
        return gradientLayer

    }
    @objc private func tapSettings() {
//        let settings = SettingsCarTableViewController()
//                let navController = UINavigationController(rootViewController: settings)
//                       navController.modalPresentationStyle = .popover
//                self.window?.rootViewController = UINavigationController(rootViewController: settings)

    }

}


