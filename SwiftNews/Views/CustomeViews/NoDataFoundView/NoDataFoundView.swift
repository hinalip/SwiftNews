//
//  NoDataFoundView.swift
//
//
//  Created by Mac on 15/11/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class NoDataFoundView: UIView {

    //MARK: - IBOutlets
    @IBOutlet weak var lblNoDataFound: UILabel!
    
    @IBOutlet weak var imgNoDataFound: UIImageView!
    
    //MARK: - Life Cycle Methods
    override func awakeFromNib() {
        self.lblNoDataFound.textColor = UIColor.appNavBarColor
    }
}
