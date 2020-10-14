//
//  ViewController.swift
//  Core Animations
//
//  Created by Steve Bernard on 14/10/2020.
//  Copyright © 2020 Steve Bernard. All rights reserved.
//

import TheAnimation
import UIKit

class ViewController: UIViewController {

     let layer = CALayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        layer.backgroundColor = UIColor.systemRed.cgColor
        layer.frame = CGRect(x: 100, y: 100, width: 150, height: 150)
        view.layer.addSublayer(layer)

        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.rotate()
            self.animatedMovement()
            self.animatedOpacity()
        }
    }


    func rotate() {
        let animation = BasicAnimation(keyPath: .transformRotationZ)
        animation.fromValue = 0
        animation.toValue = .pi * 12
        animation.duration = 1
        animation.timingFunction = .linear
        animation.fillMode  = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        animation.animate(in: layer)
    }



    func animatedMovement() {
        let animation = BasicAnimation(keyPath: .position)
        animation.fromValue = CGPoint(x: layer.frame.origin.x + (layer.frame.size.width/2),
                                      y: layer.frame.origin.y + (layer.frame.size.height/2))
        animation.toValue = CGPoint(x: 300, y: 400)
        animation.duration = 1
        animation.timingFunction = .easeInEaseOut
        animation.fillMode  = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        animation.animate(in: layer)
    }

    func animatedOpacity() {
        let animation = BasicAnimation(keyPath: .opacity)
        animation.toValue = 0
        animation.duration = 3
        animation.fromValue = 1
        animation.fillMode  = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        animation.animate(in: layer)
    }
}

