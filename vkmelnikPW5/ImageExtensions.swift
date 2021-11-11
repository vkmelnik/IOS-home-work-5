//
//  ImageExtensions.swift
//  vkmelnikPW5
//
//  Created by Vsevolod Melnik on 11.11.2021.
//

import UIKit

extension UIImage {
    
    private func makeDark(color: UIColor) -> UIColor {
        let sum = color.cgColor.components![0] + color.cgColor.components![2] + color.cgColor.components![1]
        if sum > 1.5 {
            let red = color.cgColor.components![0] / 2
            let green = color.cgColor.components![1] / 2
            let blue = color.cgColor.components![2] / 2
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
        return color
    }
    
    // This code is mostly copied from StackOverflow.
    func areaAverage() -> UIColor {

        var bitmap = [UInt8](repeating: 0, count: 4)

        let context = CIContext(options: nil)
        let cgImg = context.createCGImage(CoreImage.CIImage(cgImage: self.cgImage!), from: CoreImage.CIImage(cgImage: self.cgImage!).extent)

        let inputImage = CIImage(cgImage: cgImg!)
        let extent = inputImage.extent
        let inputExtent = CIVector(x: extent.origin.x, y: extent.origin.y, z: extent.size.width, w: extent.size.height)
        let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: inputExtent])!
        let outputImage = filter.outputImage!
        let outputExtent = outputImage.extent
        assert(outputExtent.size.width == 1 && outputExtent.size.height == 1)

        // Render to bitmap.
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: CIFormat.RGBA8, colorSpace: CGColorSpaceCreateDeviceRGB())

        // Compute result.
        let result = UIColor(red: CGFloat(bitmap[0]) / 255.0, green: CGFloat(bitmap[1]) / 255.0, blue: CGFloat(bitmap[2]) / 255.0, alpha: CGFloat(bitmap[3]) / 255.0)
        return makeDark(color: result)
    }
}

extension UIView {
    func startShimmer() {
        let gradientColorOne : CGColor = UIColor(white: 0.70, alpha: 0.5).cgColor
        let gradientColorTwo : CGColor = UIColor(white: 0.95, alpha: 0.5).cgColor
        
        let gradientLayer = CAGradientLayer()
          
        gradientLayer.frame = self.bounds

        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.colors = [gradientColorOne, gradientColorTwo,   gradientColorOne]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        self.layer.addSublayer(gradientLayer)
        
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [-1.0, -0.5, 0.0]
        animation.toValue = [1.0, 1.5, 2.0]
        animation.duration = 0.9
        animation.repeatCount = .infinity
        gradientLayer.add(animation, forKey: animation.keyPath)
    }
}
