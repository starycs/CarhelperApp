//
//  MainModel.swift
//  Carhelper
//
//  Created by Vladislav  Staryk on 04.02.2023.
//

import RealmSwift
import Foundation


class CarModel: Object {
    @Persisted var carProfileName: String = ""
    @Persisted var carModel: String = ""
    @Persisted var carType: String = ""
    @Persisted var carMileage: String = ""
    @Persisted var carFuelPerOneH: String = ""
    @Persisted var carColor: String = "1A4766"
    @Persisted var carSubscribe: Bool = true
    @Persisted var carImage: Data?
    
}
