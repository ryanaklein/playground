//: [Previous](@previous)

import Foundation
import PlaygroundSupport
import UIKit

var str = "Hello, playground"

let textView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
textView.backgroundColor = UIColor.white



let textLayer = CATextLayer()
textLayer.bounds = CGRect(x:0, y:0, width:300, height:100)
textLayer.position = textView.center
textLayer.fontSize = 36
textLayer.foregroundColor = UIColor.white.cgColor
textLayer.backgroundColor = UIColor.clear.cgColor
textLayer.string = "Hello World!"

let clearLayer = CALayer()
clearLayer.bounds = CGRect(x:0, y:0, width:300, height:100)
clearLayer.position = textView.center
clearLayer.backgroundColor = UIColor.white.cgColor


let gradientLayer = CAGradientLayer()
gradientLayer.colors = [UIColor.orange.cgColor, UIColor.lightGray.cgColor]
gradientLayer.bounds = CGRect(x: 0, y: 0, width: textView.bounds.width, height: textView.bounds.height)
gradientLayer.position = CGPoint(x:(0.0 - gradientLayer.bounds.width/2), y:textView.bounds.height/2)
gradientLayer.startPoint = CGPoint(x:0.0, y:0)
gradientLayer.endPoint = CGPoint(x:1.0, y:0)


/*let moveAnimation = CABasicAnimation(keyPath: "startPoint")
moveAnimation.fromValue = gradientLayer.position
moveAnimation.toValue = CGPoint(x:textView.bounds.width + gradientLayer.bounds.width/2, y:textView.bounds.height/2)
moveAnimation.duration = 2.5
moveAnimation.repeatCount = 7.0
gradientLayer.add(moveAnimation, forKey: "startPoint")*/

gradientLayer.mask = textLayer
textView.layer.addSublayer(gradientLayer)


PlaygroundPage.current.liveView = textView

