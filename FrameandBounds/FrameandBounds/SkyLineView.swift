//
//  SkyLineView.swift
//  FrameandBounds
//
//  Created by Egon Fiedler on 5/4/18.
//  Copyright © 2018 App Solutions. All rights reserved.
//

import Foundation
import UIKit

//Coding is the tool to get to a certain state with the information, the state can be from sending to moving it

//The purpose of this project consists in to create a landscape using only proportions
//  Math Concept:
//      - BezieLine
//This all belongs to the class UIView,
class SkyLineView: UIView {
    
    //this makes the frame
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //Why????????
        translatesAutoresizingMaskIntoConstraints = false
        //Makes the bezier path
        createBezierPath()
        drawCircle()
        self.layoutIfNeeded()
    }
    
    //Let's make it all using bounds and the size calculated by the class
    //Create shapes
    func createBezierPath() {
        //this makes the
        let shape = CAShapeLayer()
        let pathI = UIBezierPath()

        //must iterate through every side of the frame
        var sides = [1,2,3,4,5]
        
        for number in sides{
        //Make a loop
        
        if number == 1 {
            let startPoint = CGPoint(x: 0, y: bounds.midY)
            pathI.move(to: startPoint)
            let secondPoint = CGPoint(x: bounds.midX, y: bounds.midY + 100)
            
            let firstLineIControlPoint = CGPoint(x: secondPoint.x / 2, y: startPoint.y)
            let firstLineIIControlPoint = CGPoint(x: secondPoint.x / 2, y: secondPoint.y)
        }
        let thirdPoint = CGPoint(x: bounds.maxX, y: bounds.midY)
        pathII.move(to: thirdPoint)
        
        let secondLineIControlPoint = CGPoint(x: thirdPoint.x, y: thirdPoint.y)
        let secondLineIIControlPoint = CGPoint(x: thirdPoint.x, y: thirdPoint.y)
        
        pathI.addCurve(to: secondPoint, controlPoint1: firstLineIControlPoint, controlPoint2: firstLineIIControlPoint)
        pathII.addCurve(to: thirdPoint, controlPoint1: secondLineIControlPoint, controlPoint2: secondLineIIControlPoint)
        
        //path.addCurve(to: CGPoint(x: bounds.minX + 200, y: bounds.midY), controlPoint1: CGPoint(x: bounds.minX, y: bounds.midY), controlPoint2: CGPoint(x: -70, y: 10))
        
        shape.path = pathI.cgPath
        //shape.path = pathII.cgPath
        shape.lineWidth = 10
        shape.strokeColor = UIColor.blue.cgColor
        
        layer.addSublayer(shape)
        }
    }
    
    func drawCircle() -> () {
        let halfSize: CGFloat = min(bounds.size.width/2, bounds.size.height/2)
        let desiredLineWidth: CGFloat = 1
        
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x:halfSize,y:halfSize),
            radius: CGFloat(halfSize - (desiredLineWidth/2)),
            startAngle: CGFloat(0),
            endAngle: CGFloat(Double.pi * 2),
            clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = desiredLineWidth
        
        layer.addSublayer(shapeLayer)
    }
}
