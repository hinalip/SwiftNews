//
//  BaseViewController.swift
//  SwiftNews
//
//  Created by differenz137 on 29/04/21.
//

//MARK: - Author : Hinali Lad

import UIKit

class BaseViewController: UIViewController {
    
    
    //MARK: - Private Variables
    
    //UIButton
    private var btnRight: UIButton!
    private var btnLeft: UIButton!
    
    private let vwNoDataFound = Bundle.main.loadNibNamed(CustomViewIdentifiers.kNoDataFoundView, owner: self, options: nil)?[0] as? NoDataFoundView
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
}

//MARK: - Selector Methods
extension BaseViewController  {
    
    @objc func popViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func rightBarButtonClick(){
        
    }
}


//MARK: - UIHelpers
extension BaseViewController  {
    
    
    func setUpNavigationBar(barTintColor: UIColor? = .appNavBarColor,controller: UIViewController,navItem: UINavigationItem, isBackButtonEnabled : Bool = true ,navigationTitle : String) {
        
        controller.navigationController?.navigationBar.tintColor = UIColor.black
        if let barTint = barTintColor {
            controller.navigationController?.navigationBar.barTintColor = barTint
        } else {
            controller.navigationController?.navigationBar.barTintColor = .appNavBarColor
        }
        controller.navigationController?.navigationBar.backgroundColor = .white
        
        controller.navigationController?.navigationBar.isTranslucent = false
        
        
        controller.navigationController?.isNavigationBarHidden=false
        
        self.btnLeft = UIButton(type: .custom)
        let hw : CGFloat = IsDeviceIPad ? 45 : 30
        self.btnLeft.frame = CGRect(x: 0, y: 0, width:hw , height: hw)
        
        if isBackButtonEnabled {
            self.btnLeft.isHidden = false
            self.btnLeft.setImage(#imageLiteral(resourceName: "back"), for: .normal)
            self.btnLeft.addTarget(self, action: #selector(self.popViewController), for: .touchUpInside)
        } else {
            self.btnLeft.isHidden = true
        }
        
        let barButton = UIBarButtonItem(customView: self.btnLeft)
        navItem.leftBarButtonItem = nil
        self.btnLeft = nil
        
        let fontSize: CFloat = IsDeviceIPad ? 33 : 22
        //
        //
        //        let frame = CGRect(x: 0, y: 0, width: title?.getWidth(font: UIFont.robotoBoldFont(ofSize: fontSize) ) ?? 0, height: 20.0)
        
        let lblTitle = UILabel()
        lblTitle.textAlignment = .center
        lblTitle.text = navigationTitle
        lblTitle.font = UIFont.robotoBoldFont(ofSize: fontSize)
        lblTitle.textColor = .white
        
        let barTitle = UIBarButtonItem(customView: lblTitle)
        
        
        navItem.leftBarButtonItems = [barButton,barTitle]
        
    }
    
    
    /**
     This method is used to load no data found view.
     */
    func loadNoDataFoundView(parentView : UIView, message : String = "",image : UIImage? = nil) {
        vwNoDataFound?.frame = CGRect(x: 0, y: 0, width: parentView.frame.width , height: parentView.frame.height)
        if !message.isEmpty {
            vwNoDataFound?.lblNoDataFound.text = message
        }
        
        if image != nil {
            vwNoDataFound?.imgNoDataFound.image = image
        }
        parentView.addSubview(vwNoDataFound!)
    }
    
    /**
     This method is used to unload no data found view.
     */
    func unloadNoDataFoundView() {
        
        vwNoDataFound?.removeFromSuperview()
    }
    
}
