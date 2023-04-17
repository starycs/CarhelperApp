//
//  SettingsColorViewController.swift
//  Carhelper
//
//  Created by Vladislav  Staryk on 01.02.2023.
//

import UIKit

class SettingsColorViewController: UITableViewController {
    
    private let idOptionsColorCell = "idOptionsColorCell"
    private let idOptionsSettingHeader = "idOptionsSettingHeader"
    
    let headerNameArray = ["RED", "ORANGE", "YELLOW", "GREEN", "BLUE", "DEEP BLUE", "PURPLE"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.09411764706, green: 0.1215686275, blue: 0.1294117647, alpha: 1)
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.register(ColorsTableViewCell.self, forCellReuseIdentifier: idOptionsColorCell)
        tableView.register(HeaderSettingCarTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionsSettingHeader)
        
        title = "Colors settings"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsColorCell, for: indexPath) as! ColorsTableViewCell
        cell.cellConfigure(indexPath: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionsSettingHeader) as! HeaderSettingCarTableViewCell
        
        header.headerConfigure(nameArray: headerNameArray, section: section)
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0: setColor(color: "BE2813")
        case 1: setColor(color: "B97A19")
        case 2: setColor(color: "F3AF22")
        case 3: setColor(color: "32571A")
        case 4: setColor(color: "1A4766")
        case 5: setColor(color: "17004D")
        case 6: setColor(color: "8E5AF7")
        default:
            setColor(color: "FFFFFF")
        }
    }
    private func setColor(color: String) {
        let settingsOptions = self.navigationController?.viewControllers[1] as? SettingsCarTableViewController
        settingsOptions?.hexColorCell = color
        settingsOptions?.tableView.reloadRows(at:[[3,0],[4,0]], with: .none)
        self.navigationController?.popViewController(animated: true)
    
    }
}

