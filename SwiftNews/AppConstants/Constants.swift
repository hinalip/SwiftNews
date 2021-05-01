//
//  Constants.swift
//  SwiftNews
//
//  Created by differenz137 on 29/04/21.
//
//MARK: - Author : Hinali Lad

import UIKit

class Constants: NSObject {
    
    //MARK: - Navigationbar Title
    struct NavigationBarTitles {
        static let Articles = "Swift News"
    }
    
    //MARK: - ServerAPI
    struct ServerURL {
        
        static let kGetArticles = "https://www.reddit.com/r/swift/.json"
    }
    
    
    //MARK: - API Failure messages
    struct FailureMessage {
        
        static let kNoInternetConnection                    = "Please check your internet connection"
        static let kCommanErrorMessage                      = "Something went wrong. please try again later"
        static let kDataNotFound                            = "No Result Found"
        static let kProviderNotAvailable                    = "Provider has not set his/her availability. Please check again later"
        static let kInvalidImageURLString                   = "Can not convert urlstring to URL."
    }
    
}


//MARK: - Fail blocks
typealias FailureBlock = (_ status: Bool,_ error: String, _ customError: ErrorType) -> Void
typealias FailBlock = (_ statusCode: Int, _ errMessage: String) -> Void


//Error enum
enum ErrorType: String {
    
    case server = "Error"
    case connection = "No connection"
    case response = ""
}

//MARK: - Device Constants

//iPhone Screensize
struct ScreenSize {
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

//iPhone devicetype
struct DeviceType {
    static let iOS                  = "2"
    static let IS_IPHONE_4_OR_LESS  = ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6          = ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P         = ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPHONE_X          = ScreenSize.SCREEN_HEIGHT == 812.0
    
    static let IS_IPHONE_XMAX       = ScreenSize.SCREEN_HEIGHT == 896.0
    static let IS_PAD               = UIDevice.current.userInterfaceIdiom == .pad
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    static let IS_IPAD_PRO          = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1366.0
}

let IsDeviceIPad = DeviceType.IS_PAD || DeviceType.IS_IPAD || DeviceType.IS_IPAD_PRO ? true : false

let kDeviceName = UIDevice.current.name
let kDeviceSystemVersion = UIDevice.current.systemVersion
let kApplicationVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] ?? 0.0
let kApplicationBuildVersion = Bundle.main.infoDictionary?["CFBundleVersion"] ?? 0

//MARK: - UIHelpeing Constants
let appViewCornerRadius : CGFloat = IsDeviceIPad ? 9 : 6
let appSmallViewCornerRadius: CGFloat =  IsDeviceIPad ? 6 : 4
let appMinimumImageHeight : CGFloat = IsDeviceIPad ? 200.0 : 150.0
let appMaximumImageHeight : CGFloat = IsDeviceIPad ? 700.0 : 500.0


