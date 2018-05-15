//
//  ViewController.swift
//  FrameandBounds
//
//  Created by Egon Fiedler on 5/1/18.
//  Copyright © 2018 App Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var redView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
//        redSquareView()
        
////        self.view = GameBoardView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
//        self.view = BezierCurve(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func redSquareView() {
        //I have to setup
        
        //What color it will be
        //Where its goin to be X and Y
        //Height and width
        let color = UIColor(red: 255, green: 0, blue: 0, alpha: 1)
        let height = self.view.frame.height //This fills the whole screen height
        let width = self.view.frame.width //This fill the whole screen width
        
        //It's structure
        let rectangle = CGRect(x: 20, y: 20, width: width - 40, height: height - 40)
        self.redView = UIView(frame: rectangle)
        self.redView.backgroundColor = color
        
        self.view.addSubview(redView)
    }
}

