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

let view = CustomDrawingView(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
view.backgroundColor = UIColor.white
let image1 = view.imageView()!


let label = UILabel(frame: view.frame)
label.text = "Hello, World!"
label.textColor = UIColor.white
view.backgroundColor = UIColor.black
view.addSubview(label)
let image2 = view.imageViewImageMask()!

let mask = CGImage(maskWidth: image2.width, height: image2.height, bitsPerComponent: image2.bitsPerComponent, bitsPerPixel: image2.bitsPerPixel, bytesPerRow: image2.bytesPerRow, provider: image2.dataProvider!, decode: nil, shouldInterpolate: false)

let liveView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
let image3 = image1.masking(mask!)!

liveView.backgroundColor = UIColor.green
liveView.image = UIImage(cgImage: image3)

PlaygroundPage.current.liveView = liveView



