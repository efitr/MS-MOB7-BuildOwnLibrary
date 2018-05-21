//
//  GradientViewController.swift
//  BezierPath
//
//  Created by Egon Fiedler on 5/21/18.
//  Copyright © 2018 App Solutions. All rights reserved.
//

import UIKit

class BezierCurve: UIView {
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.layer.addSublayer(gradientScreen(bounds: UIScreen.main.bounds))
    }
    
    func gradientScreen(bounds: CGRect) -> CAGradientLayer
    {
        let gradientLayer = CAGradientLayer()
        gradientLayer.name = "GradientLayer"
        gradientLayer.colors = colorSet()
        gradientLayer.frame = bounds
        
        return gradientLayer
    }
    
    func colorSet() -> [CGColor]
    {
        let colorOne = UIColor(red: 252.0/255.0, green: 217/255.0, blue: 97/255.0, alpha:1.0)
        let colorTwo = UIColor(red: 202.0/255.0, green: 177/255.0, blue: 147/255.0, alpha:0.5)
        let colorSet : [CGColor] = [colorOne.cgColor, colorTwo.cgColor]
        return colorSet
    }
    
}
