//
//  CarMaintenanceModel.swift
//  Carhelper
//
//  Created by Vladislav  Staryk on 25.02.2023.
//

import RealmSwift
import Foundation

class TaskModel: Object {
    @Persisted var taskDate: Date?
    @Persisted var taskName: String = "Unknown"
    @Persisted var taskDescription: String = "Unknown"
    @Persisted var taskTf: String = "Unknown"
    @Persisted var taskColor: String = "1A4766"
    @Persisted var taskReady: Bool = false
}
