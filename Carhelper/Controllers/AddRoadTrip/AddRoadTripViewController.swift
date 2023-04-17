//
//  AddRoadTripViewController.swift
//  Carhelper
//
//  Created by Vladislav  Staryk on 02.02.2023.
//

import UIKit
import RealmSwift

class AddRoadTripViewController: UIViewController {
    
    let headerCard = CurrentView()
    let mapView = RoadTripMapingView()
    let priceView = PriceSettingView()
    let distanceView = DistanceWithPriceView()
    let customButton = CustomButtonRoad()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = #colorLiteral(red: 0.09411764706, green: 0.1215686275, blue: 0.1294117647, alpha: 1)
        scrollView.frame = view.bounds
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentSize = contentSize
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contenView = UIView()
        contenView.backgroundColor = #colorLiteral(red: 0.09411764706, green: 0.1215686275, blue: 0.1294117647, alpha: 1)
        contenView.frame.size = contentSize
        return contenView
    }()
    
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + 10)
    }
    let carModel = CarModel()
    let localRealm = try! Realm()
    var carArray: Results<CarModel>!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let carModel = localRealm.objects(CarModel.self).first {
            headerCard.configure(model: carModel)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Road Trip"
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(headerCard)
        contentView.addSubview(mapView)
        contentView.addSubview(priceView)
        contentView.addSubview(distanceView)
        contentView.addSubview(customButton.stackView)
        setConstraints()
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.touch))
        recognizer.numberOfTapsRequired = 1
        recognizer.numberOfTouchesRequired = 1
        scrollView.addGestureRecognizer(recognizer)
        
        priceView.textFieldPrice.delegate = self
        
        mapView.fromPlaceButton.addTarget(self, action: #selector(tappedMapButton), for: .touchUpInside)
        distanceView.addDistanceButton.addTarget(self, action: #selector(distanceTapped), for: .touchUpInside)
        customButton.Road.addTarget(self, action: #selector(roadTapped), for: .touchUpInside)
 
    }

    func sumDistance() -> Double {
        let fuelPerOne = headerCard.fuelPerOneHundred.text!
        let price = Double(priceView.textFieldPrice.text!) ?? 0.0
        let oneHundred = 100.0
        let distance = Double(distanceView.totaldistance.text!) ?? 0.0
        let sum = Double(price) / oneHundred * (distance)
        let sumAll = (Double(fuelPerOne) ?? 0.0) * sum
        print(sumAll)
        print(sum)
        print(fuelPerOne)
        print(price)
        print(distance)
        return sumAll
    }

    @objc func roadTapped() {
        let sum = String(sumDistance())
        distanceView.totalPrice.text = sum
        
    }
    
    @objc func distanceTapped() {
        alertDistance(name: "Write your distance", placeholder: "1234") { [self] (text) in
            distanceView.totaldistance.text = text
        }
    }
    
    @objc func tappedMapButton() {
        let map = MapViewController()
        navigationController?.pushViewController(map, animated: true)
    }
    
    @objc func touch() {
           self.contentView.endEditing(true)
       }
}
//MARK: - setConstarints
extension AddRoadTripViewController {
    func setConstraints() {
        headerCard.translatesAutoresizingMaskIntoConstraints = false
        mapView.translatesAutoresizingMaskIntoConstraints = false
        priceView.translatesAutoresizingMaskIntoConstraints = false
        distanceView.translatesAutoresizingMaskIntoConstraints = false
        customButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerCard.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 50),
            headerCard.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            headerCard.widthAnchor.constraint(equalToConstant: 300),
            headerCard.heightAnchor.constraint(equalToConstant: 100),
            
            priceView.topAnchor.constraint(equalTo: headerCard.bottomAnchor, constant: 20),
            priceView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            priceView.widthAnchor.constraint(equalToConstant: 300),
            priceView.heightAnchor.constraint(equalToConstant: 60),
            
            mapView.topAnchor.constraint(equalTo: priceView.bottomAnchor, constant: 20),
            mapView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            mapView.widthAnchor.constraint(equalToConstant: 300),
            mapView.heightAnchor.constraint(equalToConstant: 130),
            
            distanceView.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 20),
            distanceView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            distanceView.widthAnchor.constraint(equalToConstant: 300),
            distanceView.heightAnchor.constraint(equalToConstant: 130),
            
            customButton.stackView.topAnchor.constraint(equalTo: distanceView.bottomAnchor, constant: 20),
            customButton.stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            customButton.stackView.widthAnchor.constraint(equalToConstant: 300),
            customButton.stackView.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
extension AddRoadTripViewController: UITextFieldDelegate {
 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return priceView.textFieldPrice.resignFirstResponder()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.contentView.endEditing(true)
    }
}
