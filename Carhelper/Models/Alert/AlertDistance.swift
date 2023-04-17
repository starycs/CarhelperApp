//
//  AlertDistance.swift
//  Carhelper
//
//  Created by Vladislav  Staryk on 13.02.2023.
//

import Foundation

import UIKit

extension UIViewController {
    
    func alertDistance(name: String, placeholder: String, completionHandler: @escaping(String) -> Void) {
        
        let alert = UIAlertController(title: name, message: nil, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            
            
            let textFieldAlert = alert.textFields?.first
            guard let text = textFieldAlert?.text else {return}
            completionHandler(text)
        }
        alert.addTextField { (textFieldAlert) in
            textFieldAlert.placeholder = placeholder
            textFieldAlert.keyboardType = .decimalPad
        }
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
      
        
        present(alert, animated: true,completion: nil)
    }
}
