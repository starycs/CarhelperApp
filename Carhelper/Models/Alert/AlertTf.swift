//
//  AlertTf.swift
//  Carhelper
//
//  Created by Vladislav  Staryk on 25.03.2023.
//

import UIKit

extension UIViewController {
    func alertTextField(label: UILabel, name: String, placeholder: String, completionHandler: @escaping (String) -> Void) {
        let alert = UIAlertController(title: name, message: nil, preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = placeholder
            textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
            textField.leftViewMode = .always
        }
        
        let ok = UIAlertAction(title: "OK", style: .default) { _ in
            guard let text = alert.textFields?.first?.text else { return }
            label.text = text
            label.textColor = .black
            completionHandler(text)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
}

