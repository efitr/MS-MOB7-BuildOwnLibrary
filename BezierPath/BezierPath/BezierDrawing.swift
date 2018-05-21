//
//  BezierDrawing.swift
//  BezierPath
//
//  Created by Egon Fiedler on 5/21/18.
//  Copyright © 2018 App Solutions. All rights reserved.
//

import UIKit

class BezierDrawing: UIView {
    
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
        //drawCircle()
        self.layoutIfNeeded()
    }
    
    //Let's make it all using bounds and the size calculated by the class
    //Create shapes
    func createBezierPath() {
        //this makes the
        let shape = CAShapeLayer()
        shape.fillColor = UIColor.white.cgColor
        let path = UIBezierPath()
        let startPoint = CGPoint(x: bounds.minX,
                                 y: bounds.midY)
        path.move(to: startPoint)
        
        path.addCurve(to: CGPoint(x: bounds.minX + 120,
                                  y: bounds.midY + 35),
                      controlPoint1: startPoint,
                      controlPoint2: CGPoint(x: bounds.minX - 80,
                                             y: bounds.midY - 400))
        path.addCurve(to: CGPoint(x: bounds.maxX / 2 + 55,
                                  y: bounds.midY + 40),
                      controlPoint1: CGPoint(x: bounds.minX / 2 + 200,
                                             y: bounds.midY + 200),
                      controlPoint2: CGPoint(x: bounds.maxX / 2 + 55,
                                             y: bounds.midY + 30))
        path.addCurve(to: CGPoint(x: bounds.maxX ,
                                  y: bounds.midY - 10),
                      controlPoint1: CGPoint(x: bounds.maxX / 2 + 40,
                                             y: bounds.midY + 60),
                      controlPoint2: CGPoint(x: bounds.maxX,
                                             y: bounds.midY - 240))
        path.move(to: CGPoint(x: bounds.maxX ,
                              y: bounds.midY + 100))
        
        shape.path = path.cgPath
        shape.lineWidth = 5
        shape.strokeColor = UIColor.blue.cgColor
        
        let circleShape = CAShapeLayer()
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 100,y: 100),
                                      radius: CGFloat(50),
                                      startAngle: CGFloat(0),
                                      endAngle: CGFloat(Double.pi * 2),
                                      clockwise: true)
        
        circleShape.path = circlePath.cgPath
        //change the fill color
        circleShape.fillColor = UIColor.yellow.cgColor
        //you can change the stroke color=
        circleShape.strokeColor = UIColor.yellow.cgColor
        //you can change the line width
        circleShape.lineWidth = 3.0
        circleShape.frame = CGRect(x: bounds.maxX - 200, y: bounds.minY + 50, width: 100, height: 100)
        
        let shadowSublayer = createShadowLayer()
        shadowSublayer.insertSublayer(circleShape, at: 0)
        
        layer.addSublayer(shadowSublayer)
        layer.addSublayer(shape)
    }
    
    func createShadowLayer() -> CALayer {
        let shadowLayer = CALayer()
        shadowLayer.shadowColor = UIColor.orange.cgColor
        shadowLayer.shadowOffset = CGSize.zero
        shadowLayer.shadowRadius = 30.0
        shadowLayer.shadowOpacity = 1.0
        shadowLayer.backgroundColor = UIColor.clear.cgColor
        return shadowLayer
    }
    
    func drawCircle() -> () {
        let halfSize: CGFloat = min(bounds.size.width/2, bounds.size.height/2)
        let desiredLineWidth: CGFloat = 1
        
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x:halfSize,
                               y:halfSize),
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

