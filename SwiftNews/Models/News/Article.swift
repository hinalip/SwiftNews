//
//  Article.swift
//  SwiftNews
//
//  Created by differenz137 on 01/05/21.
//
//MARK: - Author : Hinali Lad

import UIKit


let kall_awardings = "all_awardings"
let kselftext = "selftext"
let ktitle = "title"
let kthumbnail_height = "thumbnail_height"
let kthumbnail = "thumbnail"
let kicon_url = "icon_url"



//MARK: - ChildrenData
class ChildrenData: NSObject {
    
    var childrenData :  Article?
    
    init(dict : [String:Any]) {
        
        if let data = dict[kdata] as? [String:Any] {
            self.childrenData =  Article(dict: data)
        }
    }
    
}


//MARK: - Article
class Article: NSObject {

    //MARK:- Instance Variables
    var articleTitle : String
    var articleBodyText : String
    var thumbNail : String
    var thumbNailHeight : CGFloat
    var allAwardings : [AllAwarding]?
    
    init(dict : [String : Any]) {
        
        self.articleTitle = dict[ktitle] as? String ?? ""
        self.articleBodyText = dict[kselftext] as? String ?? ""
        self.thumbNail = dict[kthumbnail] as? String ?? ""
        self.thumbNailHeight = dict[kthumbnail_height] as? CGFloat ?? 0.0
        
        if let awardDict = dict[kall_awardings] as? [[String : Any]] {
            
            self.allAwardings = awardDict.compactMap(AllAwarding.init)
        }
                 
    }
    
}


//MARK: - All Awarding

class AllAwarding : NSObject {
    
    //MARK:- Instance Variables
    var awardIcon : String
    
    init(dict : [String:Any]) {
        
        self.awardIcon = dict[kicon_url] as? String ?? ""
    }
    
}
