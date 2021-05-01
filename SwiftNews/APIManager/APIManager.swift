//
//  APIManager.swift
//  SwiftNews
//
//  Created by differenz137 on 30/04/21.
//

import UIKit
import Foundation
import Alamofire
import SystemConfiguration

class APIManager: NSObject {
    
    //MARK:- Instance Variables
    static let sharedInstance = APIManager()
    
    //MARK: - Private Variables
    private var alamofireManager = Alamofire.Session.default
    
}

//MARK: - Instance Methods
extension APIManager  {
    
    
    // MARK: - Check for internet connection
    
    /**
     This method is used to check internet connectivity.
     - Returns: Return boolean value to indicate device is connected with internet or not
     */
    
    class func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
    
    
    /**
     This method is used to make Alamofire request with or without parameters.
     - Parameters:
     - url: URL of request
     - method: HTTPMethod of request
     - parameter: Parameter of request
     - success: Success closure of method
     - response: Response object of request
     - failure: Failure closure of method
     - error: Failure error
     - connectionFailed: Network connection faild closure of method
     - error: Network error
     */
    class func makeRequest(with url: String, method: HTTPMethod, parameter: [String:Any]?, success: @escaping (_ response: Any) -> Void, failure: @escaping (_ error: String) -> Void, connectionFailed: @escaping (_ error: String) -> Void) {
        
        if(isConnectedToNetwork()) {
            
            print(method.rawValue, url)
            
            if let param = parameter, let data = try? JSONSerialization.data(withJSONObject: param, options: .prettyPrinted) {
                print(String(data: data, encoding: .utf8) ?? "Nil Param")
            }
            //            let headers: [String: String] = [kToken: appInstance.currentUser?.sessionId ?? ""]
            
            AF.request(url).responseJSON { (response) in
                print(response)
                
                switch (response.result) {
                    
                    case .success( let value):
                        
                        if let jsonData = try? JSONSerialization.data(withJSONObject: value, options: .prettyPrinted) {
                            
                            print("Response: \n",String(data: jsonData, encoding: String.Encoding.utf8) ?? "nil")
                           
                            success(value)
                            
                        } else {
                            let res = response.value as AnyObject
                            print(res)
                            
                            let msg = res["Message"] as? String
                            failure(msg ?? Constants.FailureMessage.kCommanErrorMessage)
                            
                            
                        }
                        
                    case .failure(let error):
                        print(error.localizedDescription)
                        print(error)
                        failure(Constants.FailureMessage.kCommanErrorMessage)
                }
            }
            
        }
        else {
            connectionFailed(Constants.FailureMessage.kNoInternetConnection)
        }
    }
}


