//
//  ArticleDetailsViewController.swift
//  SwiftNews
//
//  Created by differenz137 on 30/04/21.
//
//MARK: - Author : Hinali Lad

import UIKit

class ArticleDetailsViewController: BaseViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var lblBodyText : UILabel!
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var imgVwThumbnail : UIImageView!
    
    @IBOutlet weak var nslcImgHeight : NSLayoutConstraint!
    
    //MARK:- Instance Members
    var article = Article(dict: [:])
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.initialConfig()
        self.bindAPIDataToUI()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.decorateUI()
    }
    
}


//MARK: - UIHelpers
extension ArticleDetailsViewController  {
    
    /**
     This method is used to make initial configurations to controls.
     */
    private func initialConfig() {
        
        self.imgVwThumbnail.contentMode = .scaleToFill
        [self.lblTitle,self.lblBodyText].forEach {
            $0?.numberOfLines = 0
        }
        
    }
    
    /**
     This method is used to decorate UI controls.
     */
    private func decorateUI() {
        
        self.setUpNavigationBar(controller: self, navItem: self.navigationItem, navigationTitle: self.article.articleTitle)
        self.lblBodyText.font = UIFont.robotoRegularFont(ofSize: IsDeviceIPad ? 24 : 16)
        self.lblTitle.font = UIFont.robotoMediumFont(ofSize: IsDeviceIPad ? 27 : 18)
        
    }
    
    /**
     This method is used to  set API data to UI controls.
     */
    private func bindAPIDataToUI() {
        
        if !(self.article.thumbNail.isEmpty) && self.article.thumbNail.isValidUrl() {
            self.imgVwThumbnail.isHidden = false
            self.imgVwThumbnail.setImageFromURL(url: self.article.thumbNail)
            self.nslcImgHeight.constant = getImageviewHeight(inputHeight: self.article.thumbNailHeight)
        } else {
            self.imgVwThumbnail.isHidden = true
        }
        self.lblTitle.text = self.article.articleTitle
        self.lblBodyText.text = self.article.articleBodyText
    }
    
}
