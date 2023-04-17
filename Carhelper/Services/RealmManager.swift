//
//  RealmManager.swift
//  Carhelper
//
//  Created by Vladislav  Staryk on 04.02.2023.
//

import RealmSwift
import Foundation

class RealmManager {
    
    static let shared = RealmManager()
    
    private init() {}
    
    // Open the local-only default realm
    let realm = try! Realm()
    
    func saveCarModel(model: CarModel) {
        try! realm.write {
            realm.add(model)
        }
    }
//    func saveCarMaintenanceModel(model: CarMaintenanceModel) {
//        try! realm.write {
//            realm.add(model)
//        }
//    }
    
    func deletCarModel() {
        try! realm.write {
            realm.deleteAll()
        }
    }
    func updateImageModel(model: CarModel, imageData: Data? ) {
        try! realm.write {
            model.carImage = imageData
        }
    }
    //Task Model
    func saveTaskModel(model: TaskModel) {
        try! realm.write {
            realm.add(model)
        }
    }
    
    func deleteTaskModel(model: TaskModel) {
        try! realm.write {
            realm.delete(model)
        }
    }
    
    func updateReadyButtonTaskModel(task: TaskModel, bool: Bool) {
        try! realm.write {
            task.taskReady = bool
        }
    }
    
}
