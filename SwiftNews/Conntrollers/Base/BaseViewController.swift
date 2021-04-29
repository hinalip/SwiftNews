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
            self.btnLeft.isHidden = true
            self.btnLeft.setImage(#imageLiteral(resourceName: "back"), for: .normal)
            self.btnLeft.addTarget(self, action: #selector(self.popViewController), for: .touchUpInside)
        } else {
            self.btnLeft.isHidden = true
        }
        
        let barButton = UIBarButtonItem(customView: self.btnLeft)
        navItem.leftBarButtonItem = nil
        self.btnLeft = nil
        
        let fontSize: CFloat = IsDeviceIPad ? 33 : 22
        let lblTitle = UILabel()
        lblTitle.text = navigationTitle.uppercased()
        lblTitle.font = UIFont.robotoBoldFont(ofSize: fontSize)
        lblTitle.textColor = .white
        
        let barTitle = UIBarButtonItem(customView: lblTitle)
        
        
        navItem.leftBarButtonItems = [barButton,barTitle]
        
    }
    
}
