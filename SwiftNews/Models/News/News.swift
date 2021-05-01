//
//  News.swift
//  SwiftNews
//
//  Created by differenz137 on 01/05/21.
//

import UIKit
import SVProgressHUD

let kdata = "data"
let kdist = "dist"
let kchildren = "children"


class News: NSObject {
    
    //MARK:- Instance Variables
    var newsData : [ChildrenData]?
    
    init?(dict : [String : Any]) {
        
        if let dataDict = dict[kchildren] as? [[String:Any]] {
            
            self.newsData = dataDict.compactMap(ChildrenData.init)
        }
    }
    
}



//MARK: - API Calls
extension News  {
    
    
    /**
     This method is used to get article list.
     - Returns: article array object with success / message with failure
     */
    class func getArticles(showLoader : Bool, success withResponse : @escaping (_ totalCount : Int, _ message :String, _ news :News) -> (), failure : @escaping FailBlock) {
        
        if showLoader {
            SVProgressHUD.show()
        }
        
        APIManager.makeRequest(with: Constants.ServerURL.kGetArticles, method: .get, parameter: nil) { (response) in
            
            SVProgressHUD.dismiss()
            
            let dict = response as? [String : Any] ?? [:]
            let totalCount = dict[kdist] as? Int ?? 0
            
            if let dataDict = dict[kdata] as? [String:Any] , let objNews = News(dict: dataDict) {
                
                withResponse(totalCount,"Success",objNews)
            } else {
                failure(0,Constants.FailureMessage.kDataNotFound)
            }
            
            
        } failure: { (error) in
            SVProgressHUD.dismiss()
            failure(1000, error)
            print("failure")
        } connectionFailed: { (connectionError) in
            SVProgressHUD.dismiss()
            failure(1001, connectionError)
            print("connectionFailed")
        }
        
    }
}
