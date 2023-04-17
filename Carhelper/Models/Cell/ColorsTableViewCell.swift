//
//  ColorsTableViewCell.swift
//  Carhelper
//
//  Created by Vladislav  Staryk on 01.02.2023.
//

import UIKit

class ColorsTableViewCell:  UITableViewCell {
    
    let backgraundViewCell: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
        
        self.selectionStyle = .none
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellConfigure(indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0: backgraundViewCell.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        case 1: backgraundViewCell.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        case 2: backgraundViewCell.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        case 3: backgraundViewCell.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        case 4: backgraundViewCell.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        case 5: backgraundViewCell.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        case 6: backgraundViewCell.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        default:
            backgraundViewCell.backgroundColor = .clear
        }
    }
    
    func setConstraints() {
        
        self.addSubview(backgraundViewCell)
        NSLayoutConstraint.activate([
            backgraundViewCell.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            backgraundViewCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            backgraundViewCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            backgraundViewCell.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1)
        ])
    }
}

