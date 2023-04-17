//
//  HeaderOptionTableViewCell.swift
//  Carhelper
//
//  Created by Vladislav  Staryk on 24.03.2023.
//

import UIKit

class HeaderOptionTableViewCell:  UITableViewHeaderFooterView {
    

    let headerLable = UILabel(text: "", font: .avenirNext14())
 
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        headerLable.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        self.contentView.backgroundColor = #colorLiteral(red: 0.09411764706, green: 0.1215686275, blue: 0.1294117647, alpha: 1)
        setConstraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func headerConfigure(nameArray: [String], section: Int) {
        headerLable.text = nameArray[section]
    }
    
    func setConstraints() {
        
        self.addSubview(headerLable)
        NSLayoutConstraint.activate([
            headerLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            headerLable.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
}

