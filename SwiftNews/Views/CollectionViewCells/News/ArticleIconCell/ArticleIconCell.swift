//
//  ArticleIconCell.swift
//  SwiftNews
//
//  Created by differenz137 on 29/04/21.
//
//MARK: - Author : Hinali Lad

import UIKit

class ArticleIconCell: UICollectionViewCell {
    
    //MARK: - IBOutlet
    
    @IBOutlet weak var vwContainer : UIView!
    @IBOutlet weak var imgVwIcon : UIImageView!

    //MARK: - Life Cycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.decorateUI()
    }
}


//MARK: - UIHelpers
extension ArticleIconCell  {
   
    
    /**
     This method is used to decorate UI controls.
     */
    private func decorateUI() {
        self.imgVwIcon.contentMode = .scaleAspectFill
        self.imgVwIcon.cornerRadius = appSmallViewCornerRadius
    }
    
}


// MARK: - NibReusable
extension ArticleIconCell : ReusableView, NibLoadableView {}
