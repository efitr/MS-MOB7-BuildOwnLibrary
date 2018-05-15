//
//  ViewController.swift
//  MotionView
//
//  Created by Egon Fiedler on 5/15/18.
//  Copyright © 2018 App Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createBelowBoxes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var colors = [UIColor.red, UIColor.purple, UIColor.cyan, UIColor.brown, UIColor.darkGray]
    func createBelowBoxes() {
        for i in 0...4 {
            let view = UIView(frame: CGRect(x: CGFloat(i) * self.view.frame.width / 5, y: self.view.bounds.maxY, width: self.view.frame.width / 5, height: self.view.frame.width / 5))
            view.backgroundColor = colors[i]
            self.view.addSubview(view)
            
            let delay = 0.25 * CGFloat(i)
            UIView.animate(withDuration: 1, delay: TimeInterval(delay), options: [], animations: {view.frame = CGRect(x: CGFloat(i) * self.view.frame.width / 5, y: self.view.frame.width / 5, width: self.view.frame.width / 5, height: self.view.frame.width)
            }, completion: nil)
        }
    }
    
    
}

