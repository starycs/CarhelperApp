//
//  AlertTypeCar.swift
//  Carhelper
//
//  Created by Vladislav  Staryk on 01.02.2023.
//

import UIKit
class AlertTypeCar: UIPickerView {
    let carType = ["Benzin", "Diesel"]

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
extension AlertTypeCar: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return carType.count
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 66
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return carType[row]
    }
}

extension UIViewController {
   
    func alertTypeCar(label: UILabel, comletionHandler: @escaping(String) -> Void) {
        let alert = UIAlertController (title: "", message: nil, preferredStyle: .actionSheet)
        
        let typeCarPicker = AlertTypeCar()
        alert.view.addSubview(typeCarPicker)
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
          
            let selectedCarName = typeCarPicker.carType[typeCarPicker.selectedRow(inComponent: 0)]
                       label.text = selectedCarName
                       comletionHandler(selectedCarName)
            label.text = selectedCarName

        }

        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)

        alert.addAction(ok)
        alert.addAction(cancel)

        alert.view.heightAnchor.constraint(equalToConstant: 300).isActive = true

        typeCarPicker.translatesAutoresizingMaskIntoConstraints = false
        typeCarPicker.widthAnchor.constraint(equalTo: alert.view.widthAnchor).isActive = true
        typeCarPicker.heightAnchor.constraint(equalToConstant: 160).isActive = true
        typeCarPicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 20).isActive = true
        
        present(alert, animated: true, completion: nil)
    }
}

