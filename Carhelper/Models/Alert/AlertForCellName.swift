//
//  AlertForCellName.swift
//  Carhelper
//
//  Created by Vladislav  Staryk on 01.02.2023.
//

import UIKit

extension UIViewController {
    
    func alertForCellName(label: UILabel,name: String, placeholder: String, completionHandler: @escaping(String) -> Void) {
        
        let alert = UIAlertController(title: name, message: nil, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            
            let textFieldAlert = alert.textFields?.first
            guard let text = textFieldAlert?.text else {return}
            label.text = (text != "" ? text : label.text)
            label.textColor = .black
            completionHandler(text)
        }
        alert.addTextField { (textFieldAlert) in
            textFieldAlert.placeholder = placeholder
        }
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        present(alert, animated: true,completion: nil)
    }
}
