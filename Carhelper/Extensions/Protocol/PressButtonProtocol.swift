//
//  PressButtonProtocol.swift
//  Carhelper
//
//  Created by Vladislav  Staryk on 31.01.2023.
//
import Foundation

protocol PressReadyTaskButtonProtocol: AnyObject {
    func readyButtonTapped(indexPath: IndexPath)
}

protocol SwitchRepeatProtocol: AnyObject {
    func switchRepeat(value: Bool)
}
