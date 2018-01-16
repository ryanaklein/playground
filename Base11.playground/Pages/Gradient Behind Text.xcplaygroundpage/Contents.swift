//: [Previous](@previous)

import Foundation
import PlaygroundSupport
import UIKit

var str = "Hello, playground"

class CustomDrawingView: UIView {
    
    func imageView() -> CGImage?{
        UIGraphicsBeginImageContext(self.bounds.size)
        defer { UIGraphicsEndImageContext()}
        
        if let context = UIGraphicsGetCurrentContext() {
            self.layer.render(in: context)
            return context.makeImage()
        }
        return nil
    }
    
    func mask() -> CGImage?{
        UIGraphicsBeginImageContext(self.bounds.size)
        defer { UIGraphicsEndImageContext()}
        
        if let context = UIGraphicsGetCurrentContext() {
            self.layer.render(in: context)
            let image = context.makeImage()!
            //return image
            return CGImage(maskWidth: context.width, height: context.height, bitsPerComponent: context.bitsPerComponent, bitsPerPixel: context.bitsPerPixel, bytesPerRow: context.bytesPerRow, provider: image.dataProvider!, decode: nil, shouldInterpolate: false)
        }
        return nil
    }
    
    func imageViewImageMask() -> CGImage?{
        UIGraphicsBeginImageContext(self.bounds.size)
        defer { UIGraphicsEndImageContext()}
        
        if let context = UIGraphicsGetCurrentContext() {
            self.layer.render(in: context)
            let madeImage = context.makeImage()!
            /*let madeImage = CGImage(width: context.width, height: context.height, bitsPerComponent: context.bitsPerComponent, bitsPerPixel: context.bitsPerPixel, bytesPerRow: context.bytesPerRow, space: CGColorSpaceCreateDeviceGray(), bitmapInfo: CGBitmapInfo(), provider: someImage.dataProvider!, decode: nil, shouldInterpolate: true, intent: .absoluteColorimetric)!
            madeImage.alphaInfo.rawValue*/
            return madeImage
        }
        return nil
    }
}

let liveView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
liveView.backgroundColor = UIColor.white

let topView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
topView.backgroundColor = UIColor.orange

liveView.addSubview(topView)

let viewWithText = CustomDrawingView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
let labelView = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
let fillView = UIView(frame:CGRect(x: 0, y: 250, width: 300, height: 50))
fillView.backgroundColor = UIColor.black
//viewWithText.addSubview(fillView)
labelView.text = "Hello, World!"
labelView.textColor = UIColor.black
viewWithText.backgroundColor = UIColor.white
viewWithText.addSubview(labelView)
let mask = viewWithText.mask()

let gradientLayer = CAGradientLayer()
let alphaWhite = UIColor(red: 1, green: 1, blue: 1, alpha: 0.75).cgColor
gradientLayer.colors = [UIColor.orange.cgColor,  alphaWhite , UIColor.orange.cgColor]


gradientLayer.bounds = CGRect(x: 0, y: 0, width: 300, height: 300)
gradientLayer.position = CGPoint(x:-300, y:150)
gradientLayer.backgroundColor = UIColor.clear.cgColor
gradientLayer.startPoint = CGPoint(x:0.0, y:0)
gradientLayer.endPoint = CGPoint(x:1.0, y:0)
topView.layer.addSublayer(gradientLayer)

let moveAnimation = CABasicAnimation(keyPath: "position")
moveAnimation.fromValue = gradientLayer.position
moveAnimation.toValue = CGPoint(x:300, y:150)
moveAnimation.duration = 3.5
moveAnimation.repeatCount = 20.0
//gradientLayer.duration = 2.0
gradientLayer.add(moveAnimation, forKey: "position")

let layer = CALayer()
layer.bounds = CGRect(x: 0, y: 0, width: 300, height: 300)
layer.position = topView.center
layer.contents = mask!

//topView.layer.addSublayer(layer)
topView.layer.mask = layer

/*let bottomView = UIImageView(frame: CGRect(x: 0, y: 100, width: 300, height: 100))
bottomView.backgroundColor = UIColor.blue
bottomView.image = UIImage(cgImage: mask!)
liveView.addSubview(bottomView)*/
PlaygroundPage.current.liveView = liveView



