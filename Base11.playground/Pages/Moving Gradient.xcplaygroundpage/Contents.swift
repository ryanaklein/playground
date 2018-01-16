//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
containerView.backgroundColor = UIColor.red
PlaygroundPage.current.liveView = containerView

let gradientLayer = CAGradientLayer()
gradientLayer.colors = [UIColor.red.cgColor, UIColor.white.cgColor]


gradientLayer.bounds = CGRect(x: 0, y: 0, width: 300, height: 100)
gradientLayer.position = CGPoint(x:-300, y:50)
gradientLayer.backgroundColor = UIColor.clear.cgColor
gradientLayer.startPoint = CGPoint(x:0.0, y:0)
gradientLayer.endPoint = CGPoint(x:1.0, y:0)
containerView.layer.addSublayer(gradientLayer)


/*UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 2.0, delay: 2, options: [.curveEaseInOut], animations: {
    gradientLayer.bounds = CGRect(x: 300, y: 0, width: 300/8, height: 100)
    }, completion:nil)*/

let moveAnimation = CABasicAnimation(keyPath: "position")
moveAnimation.fromValue = gradientLayer.position
moveAnimation.toValue = CGPoint(x:300, y:50)
moveAnimation.duration = 2.0
moveAnimation.repeatCount = 7.0
//gradientLayer.duration = 2.0
gradientLayer.add(moveAnimation, forKey: "position")
