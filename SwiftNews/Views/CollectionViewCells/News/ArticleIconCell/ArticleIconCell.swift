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
    @IBOutlet weak var imgVwIcon : UIImageView!

    //MARK: - Life Cycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}


// MARK: - NibReusable
extension ArticleIconCell : ReusableView, NibLoadableView {}
