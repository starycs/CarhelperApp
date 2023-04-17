//
//  OptionTableViewCell.swift
//  Carhelper
//
//  Created by Vladislav  Staryk on 24.03.2023.
//

import UIKit

class OptionsTableViewCell:  UITableViewCell {
    
    let backgraundViewCell: UIImageView = {
       let Imageview = UIImageView()
        Imageview.backgroundColor = .white
        Imageview.layer.cornerRadius = 10
        Imageview.contentMode = .scaleAspectFit
        Imageview.clipsToBounds = true
        Imageview.translatesAutoresizingMaskIntoConstraints = false
        return Imageview
    }()
    
    let nameCellLable: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 16)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    let repeatSwitch: UISwitch = {
        let repeatSwitch = UISwitch()
        repeatSwitch.isOn = true
        repeatSwitch.isHidden = true
        repeatSwitch.translatesAutoresizingMaskIntoConstraints = false
        return repeatSwitch
    }()
    
    weak var swithRepeatDelegate: SwitchRepeatProtocol?
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
        
        self.selectionStyle = .none
        self.backgroundColor = .clear

        repeatSwitch.addTarget(self, action: #selector(switchChange(paramTarget:)), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellScheduleConfigure(nameArray: [[String]], indexPath: IndexPath, hexColor: String) {
        
        nameCellLable.text = nameArray[indexPath.section][indexPath.row]
        
        let color = UIColor().colorFromHex(hexColor)
        backgraundViewCell.backgroundColor = (indexPath.section == 3 ? color : .white)
        
        repeatSwitch.isHidden = (indexPath.section == 4 ? false : true)
        repeatSwitch.onTintColor = color
        
    }
    func cellTasksConfigure(nameArray: [String], indexPath: IndexPath, hexColor: String) {
        
        nameCellLable.text = nameArray[indexPath.section]
        
        let color = UIColor().colorFromHex(hexColor)
        backgraundViewCell.backgroundColor = (indexPath.section == 3 ? color: .white)
    
    }
    
    func cellContactConfigure(nameArray: [String], indexPath: IndexPath, image: UIImage?) {
        nameCellLable.text = nameArray[indexPath.section]
        
        if image == nil {
            indexPath.section == 4 ? backgraundViewCell.image = UIImage(systemName: "person.fill.badge.plus") : nil
        } else {
            indexPath.section == 4 ? backgraundViewCell.image = image : nil
            backgraundViewCell.contentMode = .scaleAspectFill
        }
    }
    
    @objc func switchChange(paramTarget: UISwitch) {
        swithRepeatDelegate?.switchRepeat(value: paramTarget.isOn)
    }
    
    func setConstraints() {
        
        self.addSubview(backgraundViewCell)
        NSLayoutConstraint.activate([
            backgraundViewCell.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            backgraundViewCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            backgraundViewCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            backgraundViewCell.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1)
        ])
        
        self.addSubview(nameCellLable)
        NSLayoutConstraint.activate([
            nameCellLable.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameCellLable.leadingAnchor.constraint(equalTo: backgraundViewCell.leadingAnchor, constant: 15)
        ])
        
        self.contentView.addSubview(repeatSwitch)
        NSLayoutConstraint.activate([
            repeatSwitch.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            repeatSwitch.trailingAnchor.constraint(equalTo: backgraundViewCell.trailingAnchor, constant: -15)
        ])
    }
}
