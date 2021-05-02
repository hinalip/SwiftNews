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
    @IBOutlet weak var vwContainer : UIView!
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var imgVwThumbnail : UIImageView!
    @IBOutlet weak var cvIconImages : UICollectionView!
    
    
    //NSLayoutConstraint
    @IBOutlet weak var nslcImgThumbnailHeight: NSLayoutConstraint!
    
    //MARK:- Pivate Variables
    private var awardings = [AllAwarding]()
    
    //MARK: - Life Cycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        self.initialConfig()
        self.decorateUI()
        
    }
}


//MARK: - UIHelpers
extension ArticleCell  {
    
    /**
     This method is used to make initial configurations to controls.
     */
    private func initialConfig() {
        
//        self.cvIconImages.addObserver(self, forKeyPath: ObseverStrings.kContentSize, options: .new, context: nil)
        
        self.cvIconImages.register(ArticleIconCell.self)
        self.cvIconImages.delegate = self
        self.cvIconImages.dataSource = self
        self.imgVwThumbnail.contentMode = .scaleAspectFill
        
    }
    
    /**
     This method is used to decorate UI controls.
     */
    private func decorateUI() {
        
        self.lblTitle.font = UIFont.robotoRegularFont(ofSize: IsDeviceIPad ? 27 : 18)
        self.imgVwThumbnail.cornerRadius = appSmallViewCornerRadius
        self.vwContainer.setShadow()
        
    }
    
}

//MARK: - Instance Methods
extension ArticleCell  {
    
    /**
     This method is used to reload collectionview.
     */
    func reloadCollectionView(awardings : [AllAwarding]) {
        
        self.awardings = awardings
        
        if self.awardings.count > 0 {
            self.cvIconImages.isHidden = false
        } else {
            self.cvIconImages.isHidden = true
        }
        
        self.cvIconImages.reloadData()
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ArticleCell : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        self.awardings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : ArticleIconCell = collectionView.dequeueReusableCell(for: indexPath)
        
        
        if !((self.awardings[indexPath.row].awardIcon ?? "").isEmpty) && (self.awardings[indexPath.row].awardIcon ?? "").isValidUrl() {
            
            cell.imgVwIcon.isHidden = false
            
            cell.imgVwIcon.setImageFromURL(url: self.awardings[indexPath.row].awardIcon)
        } else {
            cell.imgVwIcon.isHidden = true
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let hw : CGFloat = IsDeviceIPad ? 120 : 90
       
        return CGSize(width: hw, height: hw )
    }
    
}


// MARK: - NibReusable
extension ArticleCell : ReusableView, NibLoadableView {}
