//
//  CropImage.swift
//  MapApp
//
//  Created by Anna Rosner on 3/20/22.
//

import Foundation
import UIKit

func cropImage (_ inputImage: String, _ width: CGFloat, _ height: CGFloat) -> UIImage {
    let sourceImage = UIImage(named: inputImage)!
    let inputSize = sourceImage.size
    let xOffset = (inputSize.width - width) / 2.0
    let yOffset = (inputSize.height - height) / 2.0
    
    let cropRect = CGRect(
        x: xOffset,
        y: yOffset,
        width: width,
        height: height
    ).integral
    
    let inputCGImage = sourceImage.cgImage!
    let croppedCGImage = inputCGImage.cropping(to: cropRect)!
    
    let croppedImage: UIImage = UIImage(cgImage: croppedCGImage)
    return croppedImage
    
}
