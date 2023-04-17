//
//  AlertDate.swift
//  Carhelper
//
//  Created by Vladislav  Staryk on 24.03.2023.
//

import UIKit

@available(iOS 13.4, *)
extension UIViewController {
    
    func alertDate(label: UILabel, comletionHandler: @escaping(Int, Date) -> Void) {
        
        let alert = UIAlertController (title: "", message: nil, preferredStyle: .actionSheet)
        
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        
        
        alert.view.addSubview(datePicker)
        
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy"
            let dateString = dateFormatter.string(from: datePicker.date)
            
            let calendar = Calendar.current
            let component = calendar.dateComponents([.weekday], from: datePicker.date)
            guard let weekday = component.weekday else {return}
            
            let numberWeekday = weekday
            let date = datePicker.date
            comletionHandler(numberWeekday, date)
            
            label.text = dateString
            label.textColor = .black
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        alert.view.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.widthAnchor.constraint(equalTo: alert.view.widthAnchor).isActive = true
        datePicker.heightAnchor.constraint(equalToConstant: 160).isActive = true
        datePicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 20).isActive = true
        
        
        present(alert, animated: true, completion: nil)
        
    }
}

