//
//  Global.swift
//  SwiftNews
//
//  Created by differenz137 on 29/04/21.
//

import Foundation
import UIKit
import SDWebImage

//MARK: - UIColor Extension
extension UIColor {
    static let appGreyColor = #colorLiteral(red: 0.6039215686, green: 0.6039215686, blue: 0.6039215686, alpha: 1)
    static let appDeepGreyColor = #colorLiteral(red: 0.431372549, green: 0.431372549, blue: 0.431372549, alpha: 1)
    static let appNavBarColor = #colorLiteral(red: 0.8078431373, green: 0.1294117647, blue: 0.2941176471, alpha: 1)
}


//MARK: - UINavigationController Extension
extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

//MARK: - String
extension String  {
    /**
     This method is used to  get the width of string.
     - Parameter font : UIFont of the string.
     - Returns: CGFloat - width of the string
     */
    func getWidth(font: UIFont?) -> CGFloat {
        let attributes = font != nil ? [NSAttributedString.Key.font: font] : [:]
        return self.size(withAttributes: attributes as [NSAttributedString.Key : Any]).width
    }
    
    /**
     This method is used to validate the absolute string of url.
     - Returns: Return boolen value to indicate if url is valid or not
     */
    func isValidUrl () -> Bool {
        let urlRegEx = "(?i)https?://(?:www\\.)?\\S+(?:/|\\b)"
        return NSPredicate(format: "SELF MATCHES %@", urlRegEx).evaluate(with: self)
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


//MARK: - UIImageView Extension
extension UIImageView {
    /**
     This method is used to set image from url.
     - Parameter url : an absolute string containg image's url.
     - defaultImage : UIImage for default image if url is not available.
     */
    func setImageFromURL(url : String?, defaultImage : UIImage? = nil ) {
        
        if let urlString = url, url?.isEmpty == false {
            
            if let imageURL = URL(string: urlString) {
                self.sd_setImage(with: imageURL, placeholderImage: defaultImage)
            } else {
                print(Constants.FailureMessage.kInvalidImageURLString)
            }
        } else {
            self.image = defaultImage
            print("Invalid URL.")
        }
    }
}
