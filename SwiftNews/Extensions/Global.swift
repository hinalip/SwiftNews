//
//  Global.swift
//  SwiftNews
//
//  Created by differenz137 on 29/04/21.
//

import Foundation
import UIKit

//MARK: - UIColor Extension
extension UIColor {
    static let appGreyColor = #colorLiteral(red: 0.6039215686, green: 0.6039215686, blue: 0.6039215686, alpha: 1)
    static let appDeepGreyColor = #colorLiteral(red: 0.431372549, green: 0.431372549, blue: 0.431372549, alpha: 1)
    static let appNavBarColor = #colorLiteral(red: 0.8078431487, green: 0.1291992679, blue: 0.2925019158, alpha: 1)
}


//MARK: - UINavigationController Extension
extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}


// MARK: - UIFont's Extension
extension UIFont {
    static func robotoBlackFont(ofSize fontSize: CFloat) -> UIFont {
        return UIFont(name: "Roboto-Black", size: CGFloat(fontSize))!
    }
    
    static func robotoLightFont(ofSize fontSize: CFloat) -> UIFont {
        return UIFont(name: "Roboto-Light", size: CGFloat(fontSize))!
    }
    
    static func robotoRegularFont(ofSize fontSize: CFloat) -> UIFont {
        return UIFont(name: "Roboto-Regular", size: CGFloat(fontSize))!
    }
    
    static func robotoBoldFont(ofSize fontSize: CFloat) -> UIFont {
        return UIFont(name: "Roboto-Bold", size: CGFloat(fontSize))!
    }
        
    static func robotoMediumFont(ofSize fontSize: CFloat) -> UIFont {
        return UIFont(name: "Roboto-Medium", size: CGFloat(fontSize))!
    }
}
