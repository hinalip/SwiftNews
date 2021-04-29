//
//  ArticleCell.swift
//  SwiftNews
//
//  Created by differenz137 on 29/04/21.
//
//MARK: - Author : Hinali Lad
import UIKit

class ArticleCell: UITableViewCell {
    
    //MARK: - IBOutlet
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var imgVwThumbnail : UIImageView!
    @IBOutlet weak var cvIconImages : UICollectionView!
    
    //MARK: - Life Cycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    
}


//MARK: - UIHelpers
extension ArticleCell  {
    
    /**
     This method is used to make initial configurations to controls.
     */
    private func initialConfig() {
        
    }
    
    /**
     This method is used to decorate UI controls.
     */
    private func decorateUI() {
        
        self.lblTitle.font = UIFont.robotoRegularFont(ofSize: IsDeviceIPad ? 27 : 18)
    }
    
}

// MARK: - NibReusable
extension ArticleCell : ReusableView, NibLoadableView {}
