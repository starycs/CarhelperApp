//
//  AlertModelCar.swift
//  Carhelper
//
//  Created by Vladislav  Staryk on 01.02.2023.
//


import UIKit
class CarPickerView: UIPickerView {
    let carNames = ["Toyota", "Honda", "Ford", "Chevrolet", "Nissan", "Hyundai", "Kia", "Mazda", "Volkswagen", "Audi", "BMW", "Mercedes-Benz", "Subaru", "Lexus", "Jeep", "Dodge", "Ram", "GMC", "Cadillac", "Buick", "Acura", "Infiniti", "Volvo", "Land Rover", "Mini", "Fiat", "Alfa Romeo", "Porsche", "Tesla"]

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.dataSource = self
        self.delegate = self
      
    
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.dataSource = self
        self.delegate = self
    }
}

// MARK: - UIPickerViewDataSource
extension CarPickerView: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return carNames.count
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 66
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return carNames[row]
    }
}

extension UIViewController {
   
    func alertModelCar(label: UILabel, comletionHandler: @escaping(String) -> Void) {
        let alert = UIAlertController (title: "", message: nil, preferredStyle: .actionSheet)
        let modelPicker = CarPickerView()
        alert.view.addSubview(modelPicker)
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
          
            let selectedCarName = modelPicker.carNames[modelPicker.selectedRow(inComponent: 0)]
                       label.text = selectedCarName
                       comletionHandler(selectedCarName)
            label.text = selectedCarName

        }

        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)

        alert.addAction(ok)
        alert.addAction(cancel)

        alert.view.heightAnchor.constraint(equalToConstant: 300).isActive = true

        modelPicker.translatesAutoresizingMaskIntoConstraints = false
        modelPicker.widthAnchor.constraint(equalTo: alert.view.widthAnchor).isActive = true
        modelPicker.heightAnchor.constraint(equalToConstant: 160).isActive = true
        modelPicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 20).isActive = true
        
        
        present(alert, animated: true, completion: nil)

    }
}
