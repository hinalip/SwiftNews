//
//  GlobalFunctions.swift
//  SwiftNews
//
//  Created by differenz137 on 01/05/21.
//
//MARK: - Author : Hinali Lad

import Foundation
import UIKit

/**
 This method is used to fetch image height to display.
 */
func getImageviewHeight(inputHeight: CGFloat?, minHeight: CGFloat = appMinimumImageHeight, maxHeight: CGFloat = appMaximumImageHeight ) -> CGFloat {
    
    var imageHeight: CGFloat = 0.0
    if (inputHeight ?? 0.0 <= minHeight) {
        imageHeight = minHeight
    } else if (inputHeight ?? 0 >= maxHeight) {
        imageHeight = maxHeight
    }else{
        imageHeight = inputHeight ?? 0.0
    }
    return imageHeight
}
