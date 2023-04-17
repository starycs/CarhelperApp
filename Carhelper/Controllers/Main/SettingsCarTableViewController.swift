//
//  SignOutViewController.swift
//  Carhelper
//
//  Created by Vladislav  Staryk on 30.01.2023.
//
import UIKit
import RealmSwift
class SettingsCarTableViewController: UITableViewController {
    
    private let idSettingsCarTableViewCell = "idsettingsCarTableViewCell"
    private let idsSettingCarHeader = "idOptionsScheduleHeader"
    
    let headerNameArray = ["Your Profile Name", "Your car", "Average fuel consumption per 100 km", "COLOR", "Subscribe", "Choose image"]
    
    var cellNameArray = [["Name"],
                         ["Model","Type","Car mileage"],
                         ["fuel per 100 km"],
                         [""],
                         ["Repeat every 7 days"],
                         [""]]
    
    var carModel = CarModel()
    var imageIsChanged = false
    var editModel = false
    var dataImage: Data?
    var hexColorCell = "1A4766"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.09411764706, green: 0.1215686275, blue: 0.1294117647, alpha: 1)
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.register(SettingsCarTableViewCell.self, forCellReuseIdentifier: idSettingsCarTableViewCell)
        tableView.register(HeaderSettingCarTableViewCell.self, forHeaderFooterViewReuseIdentifier: idsSettingCarHeader)
        
        title = "Car settings"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "checkmark.circle.fill"), style: .plain, target: self, action: #selector(saveCarModelTapped))
        navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        
    }
    
    @objc private func saveCarModelTapped() {
        print("save")
        
        carModel.carColor = hexColorCell
        setImageModel()
        RealmManager.shared.deletCarModel()
        RealmManager.shared.updateImageModel(model: carModel, imageData: dataImage)
        RealmManager.shared.saveCarModel(model: carModel)
        carModel = CarModel()
        carModel.realm?.refresh()
        
        alertOK(title: "Success")
        hexColorCell = "1A4766"
        tableView.reloadData()  
    }
    @objc private func setImageModel() {
        
        if imageIsChanged {
            let cell = tableView.cellForRow(at: [5,0]) as! SettingsCarTableViewCell
            
            let image = cell.backgraundViewCell.image
            guard let imageData = image?.pngData() else { return }
            dataImage = imageData
            
            cell.backgraundViewCell.contentMode = .scaleAspectFill
            imageIsChanged = false
        } else {
            dataImage = nil
        }
    }
    
// TableView
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return 3
        case 2: return 1
        case 3: return 1
        case 4: return 1
        case 5: return 1
        default:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idSettingsCarTableViewCell , for: indexPath) as! SettingsCarTableViewCell
        
        if editModel == false {
            cell.cellCarConfigure(nameArray: cellNameArray, indexPath: indexPath, hexColor: hexColorCell, image: nil)
        } else if let data = carModel.carImage, let image = UIImage(data: data) {cell.cellCarConfigure(nameArray: cellNameArray, indexPath: indexPath, hexColor: hexColorCell, image: image)
        } else {
            cell.cellCarConfigure(nameArray: cellNameArray, indexPath: indexPath, hexColor: hexColorCell, image: nil)
        }
        
        cell.swithRepeatDelegate = self
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.section == 5 ? 200 : 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idsSettingCarHeader) as! HeaderSettingCarTableViewCell
        
        header.headerConfigure(nameArray: headerNameArray, section: section)
        return header
        
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! SettingsCarTableViewCell
        
        switch indexPath {
        case [0,0]:
            alertForCellName(label: cell.nameCellLable, name: "Name", placeholder: "Enter your name") { [self] (name) in
                carModel.carProfileName = name
            }
        case [1,0]:
            alertModelCar(label: cell.nameCellLable) { [self] (model) in
                carModel.carModel = model
            }
        case [1,1]:
            alertTypeCar(label: cell.nameCellLable) { [self] (type) in
                carModel.carType = type
            }
        case [1,2]:
            alertMileageAndFuelPerH(label: cell.nameCellLable, name: "Car mileage", placeholder: "Enter your car mileage") { [self] (mileage) in
                carModel.carMileage = mileage
            }
            
        case [2,0]:
            alertMileageAndFuelPerH(label: cell.nameCellLable, name: "Fuel per 100 km", placeholder: "Enter fuel per 100 km ") { [self] (fuel) in
                carModel.carFuelPerOneH = fuel
            }
        case[3,0]: pushControllers(vc: SettingsColorViewController())
        case[4,0]: print("switch")
        case[5,0]: alertPhotoOrCamera { [self] source in
            chooseImagePicker(source: source)
        }
        default:
            print("tap swttings tableview")
        }
    }
    func pushControllers(vc: UIViewController) {
        let viewController = vc
        navigationController?.navigationBar.topItem?.title = "Car settings"
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension SettingsCarTableViewController: SwitchRepeatProtocol {
    func switchRepeat(value: Bool) {
        carModel.carSubscribe = value
        print(value)
    }
}

//MARK: UIImagePickerControllerDelegate, UINavigationControllerDelegate

extension SettingsCarTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let cell = tableView.cellForRow(at: [5,0]) as! SettingsCarTableViewCell
        cell.backgraundViewCell.image = info[.editedImage] as? UIImage
        cell.backgraundViewCell.contentMode = .scaleAspectFill
        cell.backgraundViewCell.clipsToBounds = true
        imageIsChanged = true
        dismiss(animated: true)
    }
}

