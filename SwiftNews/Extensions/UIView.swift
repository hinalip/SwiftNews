//
//  UIView.swift
//  SwiftNews
//
//  Created by differenz137 on 30/04/21.
//

import Foundation
import UIKit

//MARK: - UIView
extension UIView {
    
    /**
     This property is used to set corener radius of UIView for iPhone.
     */
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    
    /**
     This method is used to  set shadow to uiview.
     - Parameter shadowColor: UIColor for shadow
     - shadowRadius: CGFloat - radius for the shadow.
     - Returns: nil
     */
    func setShadow(shadowColor : UIColor = .lightGray, shadowRadius : CGFloat = appViewCornerRadius, cornerRadius : CGFloat = appSmallViewCornerRadius) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = 0.6
        self.layer.shadowOffset = CGSize.zero
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowRadius = shadowRadius
    }
}
