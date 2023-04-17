//
//  MainTabBarController.swift
//  Carhelper
//
//  Created by Vladislav  Staryk on 11.02.2023.
//

import UIKit
import RealmSwift

//@available(iOS 15.0, *)
class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    func setupTabBar() {
        
        let mainShowCarViewController = createNavController(vc: MainShowCarViewController(), itemName: "Main", ItemImage: "car")
        let addRoadTripViewController = createNavController(vc: AddRoadTripViewController(), itemName: "Road trip", ItemImage: "location.viewfinder")
        let carMaintenanceViewController = createNavController(vc: CarMaintenanceViewController(), itemName: "Car Maintenance", ItemImage: "gearshape")
        
        viewControllers = [mainShowCarViewController, addRoadTripViewController, carMaintenanceViewController]
        
    }
    
    func createNavController(vc: UIViewController, itemName: String, ItemImage: String) ->UINavigationController {
        
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: ItemImage)?.withAlignmentRectInsets(.init(top: 0, left: 0, bottom: 0, right: 0)), tag: 0)
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 0)
        
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        //navController.navigationBar.scrollEdgeAppearance = navController.navigationBar.standardAppearance
        
        return navController
    }
}
