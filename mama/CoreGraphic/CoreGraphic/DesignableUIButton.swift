//
//  DesignableUIButton.swift
//  CoreGraphic
//
//  Created by Moeung Theara on 11/28/16.
//  Copyright © 2016 Moeung Theara. All rights reserved.
//

import UIKit

@IBDesignable class DesignableUIButton: UIButton {
    @IBInspectable var color:UIColor =  UIColor.blue
   override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        color.setFill()
        path.fill()
        drawSign()
    }
    func drawSign() {
        drawHorizontalDash()
    }
    func drawHorizontalDash(){
        let plusHeight:CGFloat = 3.0
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * 0.6
        
        //create the path
        let plusPath = UIBezierPath()
        plusPath.lineWidth = plusHeight
        plusPath.move(to: CGPoint(x: bounds.width/2 - plusWidth/2 , y: bounds.height/2))
        plusPath.addLine(to: CGPoint(x: bounds.width/2 + plusWidth/2, y: bounds.height/2))
        UIColor.white.setStroke()
        plusPath.stroke()
    }
}
