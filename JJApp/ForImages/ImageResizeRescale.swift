//
//  ImageResizeRescale.swift
//  JJApp
//
//  Created by Arnella Tolegen on 28.07.2023.
//

import Foundation
import UIKit

func compressAndResizeImage(_ image: UIImage, quality: CGFloat, maxSizeKB: Int) -> Data? {
    guard let imageData = image.jpegData(compressionQuality: quality) else {
        print("Error obtaining image data.")
        return nil
    }
    
    let maxSizeBytes = maxSizeKB * 1024
    var currentSizeBytes = imageData.count
    
    while currentSizeBytes > maxSizeBytes, let resizedImage = resizeImage(image, scale: 0.9) {
        guard let newImageData = resizedImage.jpegData(compressionQuality: quality) else {
            print("Error obtaining resized image data.")
            return nil
        }
        
        currentSizeBytes = newImageData.count
        if currentSizeBytes <= maxSizeBytes {
            return newImageData
        }
    }
    
    return imageData
}

func resizeImage(_ image: UIImage, scale: CGFloat) -> UIImage? {
    let size = CGSize(width: image.size.width * scale, height: image.size.height * scale)
    UIGraphicsBeginImageContext(size)
    image.draw(in: CGRect(origin: .zero, size: size))
    let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return resizedImage
}
