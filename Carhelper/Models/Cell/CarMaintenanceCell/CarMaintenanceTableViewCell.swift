//
//  CarMaintenanceTableViewCell.swift
//  Carhelper
//
//  Created by Vladislav  Staryk on 25.02.2023.
//

import UIKit

class TasksTableViewCell:  UITableViewCell {
    
    let taskName = UILabel(text: "Програмирование", font: .avenirNextDemiBold20())
    let taskDescription = UILabel(text: " Научиться писать extension и правильно их применять, Научиться писать extension и правильно их применять", font: .avenirNext14())
    let dateLabel = UILabel(text: "", font: .avenirNextDemiBold20())
    
    let readyButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "chevron.down.circle"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    weak var cellTaskDelegate: PressReadyTaskButtonProtocol?
    var index: IndexPath?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        taskDescription.numberOfLines = 2
        
        setConstraints()
        
        readyButton.addTarget(self, action: #selector(readyButtonTapped), for: .touchUpInside)
       
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func readyButtonTapped() {
        
        guard let index = index else { return }
        cellTaskDelegate?.readyButtonTapped(indexPath: index)
    }
    
    func configure(model: TaskModel) {
        
        taskName.text = model.taskName
        taskDescription.text = model.taskDescription
        dateLabel.text = model.taskDate?.formatted()
        backgroundColor = UIColor().colorFromHex("\(model.taskColor)")
        
        if model.taskReady {
            readyButton.setBackgroundImage(UIImage(systemName: "chevron.down.circle.fill"), for: .normal)
        } else {
            readyButton.setBackgroundImage(UIImage(systemName: "chevron.down.circle"), for: .normal)
        }
    }
    
    private func setConstraints() {
        
        self.contentView.addSubview(readyButton)
        NSLayoutConstraint.activate([
            readyButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            readyButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            readyButton.heightAnchor.constraint(equalToConstant: 40),
            readyButton.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        self.addSubview(taskName)
        NSLayoutConstraint.activate([
            taskName.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            taskName.trailingAnchor.constraint(equalTo: readyButton.leadingAnchor, constant: -5),
            taskName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            taskName.heightAnchor.constraint(equalToConstant: 25),
        ])
        
        self.addSubview(taskDescription)
        NSLayoutConstraint.activate([
            taskDescription.topAnchor.constraint(equalTo: taskName.bottomAnchor, constant: 5),
            taskDescription.trailingAnchor.constraint(equalTo: readyButton.leadingAnchor, constant: -5),
            taskDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            taskDescription.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
        
        self.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            dateLabel.trailingAnchor.constraint(equalTo: taskName.trailingAnchor, constant: -15),
            dateLabel.heightAnchor.constraint(equalToConstant: 40),
            dateLabel.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
}


