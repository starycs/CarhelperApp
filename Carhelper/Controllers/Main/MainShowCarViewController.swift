//
//  ViewController.swift
//  Carhelper
//
//  Created by Vladislav  Staryk on 28.01.2023.
//

import UIKit
import RealmSwift
import SwiftUI

class MainShowCarViewController: UIViewController {
    
    //some code
    //sasassa
    //676767
    //hhjbhj
    
    let header = CarTopCard()
    let footer = ButtonCardViewInfo()
    
    let carImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "launch")
        imageView.frame = CGRect(x: 0, y: 0, width: 98, height: 98)
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let total = UILabel(text: "",
                        font:UIFont(name: "Abhaya Libre SemiBold",
                                    size: 27),alignment: .center)
    
    let backgraundImage = UIImage(named: "backcolor")
    
    let localRealm = try! Realm()
    var carArray: Results<CarModel>!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let carModel = localRealm.objects(CarModel.self).first {
            header.configure(model: carModel)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(patternImage: backgraundImage!)
        let imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .scaleAspectFill
        imageView.image = backgraundImage
        view.addSubview(imageView)
        
        view.addSubview(header)
        view.addSubview(total)
        view.addSubview(footer)
        setConstraints()
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //Setting View
        footer.layer.shadowColor = UIColor.black.cgColor
        footer.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        footer.layer.shadowOpacity = 0.2
        footer.layer.shadowRadius = 4.0
        
        header.colorButton.addTarget(self, action: #selector(tapSettings), for: .touchUpInside)
        
    }

    @objc private func tapSettings() {
        let setting = SettingsCarTableViewController()
        setting.carModel = CarModel()
        setting.editModel = true
        
        navigationController?.pushViewController(setting, animated: true)
    }
}

//MARK: - setConstarints
extension MainShowCarViewController {
    func setConstraints() {
        
        header.translatesAutoresizingMaskIntoConstraints = false
        footer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            header.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            header.widthAnchor.constraint(equalToConstant: 320),
            header.heightAnchor.constraint(equalToConstant: 150),
           
            total.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 200),
            total.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            total.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            total.heightAnchor.constraint(equalToConstant: 40),
            
            footer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -120),
            footer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            footer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            footer.widthAnchor.constraint(equalToConstant: 320),
            footer.heightAnchor.constraint(equalToConstant: 150),
            
        ])
    }
}
