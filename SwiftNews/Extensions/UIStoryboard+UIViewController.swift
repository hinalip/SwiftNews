//
//  UIStoryboard+UIViewController.swift
//  SwiftNews
//
//  Created by differenz137 on 29/04/21.
//

import Foundation
import UIKit

//MARK: - UIStoryboard Extension
extension UIStoryboard {
    
    /**
     This method is used to get the storyboard object.
     - Parameter name: Name of storyboard.
     - Returns: Return UIStoryboard object
     */
    class func getStoryboard(for name: String) -> UIStoryboard {
        return UIStoryboard(name: name, bundle: nil)
    }
    
    /**
     This method is used to get view controller from its identifier.
     - Parameter identifier: Identifier of view controller
     - Returns: Return view controller object
     */
    func getViewController(with identifier: String) -> UIViewController {
        return self.instantiateViewController(withIdentifier: identifier)
    }
}
