//
//  addCarMaintenance.swift
//  Carhelper
//
//  Created by Vladislav  Staryk on 25.02.2023.
//
import UIKit
import RealmSwift

class AddCarMaintenance: UITableViewController {
    
    let carView = CarMaintenanceViewController()
    
    private let idOptionsTaskCell = "idOptionsTaskCell"
    private let idOptionsTasksHeader = "idOptionsTasksHeader"
    
    let headerNameArray = ["DATE", "Scheduled maintenance", "Car mileage", "COLOR", "345678"]
    
    var cellNameArrayAdd = ["Date", "Lesson", "Task", ""]
    
    var hexColorCell = "1A4766"
    
    var taskModel = TaskModel()
    var editModel = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Options Tasks"
      
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.09411764706, green: 0.1215686275, blue: 0.1294117647, alpha: 1)
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: idOptionsTaskCell)
        tableView.register(HeaderOptionTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionsTasksHeader)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save,
                                                            target: self,
                                                            action: #selector(saveTasksButtonTapped))
    }
    
    @objc private func saveTasksButtonTapped() {
            taskModel.taskColor = hexColorCell
            RealmManager.shared.saveTaskModel(model: taskModel)
            taskModel = TaskModel()
            alertOK(title: "Succes")
            hexColorCell = "1A4766"
            tableView.reloadData()

    }
    
    private func pushControllers(vc: UIViewController) {
        let viewController = vc
        navigationController?.navigationBar.topItem?.title = "Options"
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    //MARK: UITableViewDelegate, UITableViewDataSorce
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsTaskCell, for: indexPath) as! OptionsTableViewCell
        cell.cellTasksConfigure(nameArray: cellNameArrayAdd, indexPath: indexPath, hexColor: hexColorCell)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 44
        } else if indexPath.section == 1 {
            return 100
        }
        return 44
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionsTasksHeader) as! HeaderOptionTableViewCell
        
        header.headerConfigure(nameArray: headerNameArray, section: section)
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! OptionsTableViewCell
        
        switch indexPath.section {
        case 0: alertDate(label: cell.nameCellLable) { [self] (numberWeekday, date) in
            self.taskModel.taskDate = date
        }
        case 1: alertForCellName(label: cell.nameCellLable, name: "Name Lesson", placeholder: "Enter name lesson") { text in
            self.taskModel.taskName = text
        }
        case 2: alertForCellName(label: cell.nameCellLable, name: "Name Task", placeholder: "Enter name task") { text in
            self.taskModel.taskDescription = text
        }
        case 3: pushControllers(vc: TaskColorsTableViewController())
        default:
            print("TAP OPTIONS TABLE VIEW")
        }
    }
}
