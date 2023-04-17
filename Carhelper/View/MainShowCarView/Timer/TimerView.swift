//
//  TimerView.swift
//  Carhelper
//
//  Created by Vladislav  Staryk on 29.01.2023.
//
//import UIKit
//
//class CircleTimerView: UIView {
//    
//    private var circleLayer: CAShapeLayer!
//    private var timer: Timer!
//    private var timeRemaining: Double = 0
//    private var totalTime: Double = 0
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setup()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setup()
//    }
//    
//    private func setup() {
//        let center = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
//        let radius = self.bounds.width / 2
//        let startAngle = CGFloat(-Double.pi / 2)
//        let endAngle = startAngle + CGFloat(2 * Double.pi)
//        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
//    }
//}
