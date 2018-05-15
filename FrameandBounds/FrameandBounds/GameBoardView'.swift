//
//  ChessBoardViewController.swift
//  FrameandBounds
//
//  Created by Egon Fiedler on 5/1/18.
//  Copyright © 2018 App Solutions. All rights reserved.
//
//
import Foundation
import UIKit

class GameBoardView: UIView {
    
    //What does it do
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    //An error protection
    required init?(coder aDecoder: NSCoder) {
        fatalError("the ship is down!")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        var yCoord: CGFloat = 0
        let screen = UIScreen.main.bounds
        self.backgroundColor = UIColor.white
        for i in 0...8 {
            var xCoord: CGFloat = 0
            var isBlack = true
            if i % 2 == 0 {
                isBlack = false
            }
            for _ in 0...8 {

                
                let checkerBox = UIView(frame: CGRect(x: xCoord, y: yCoord, width: screen.width / 8, height: screen.width / 8))
                
                if isBlack {
                    checkerBox.backgroundColor = UIColor.black
                    isBlack = false
                } else {
                    isBlack = true
                }
                
                self.addSubview(checkerBox)
                
                xCoord = xCoord + (screen.width / 8)
            }
            yCoord = yCoord + (screen.width / 8)
            
        }
    }
}

