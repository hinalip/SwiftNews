//
//  ArticlesViewController.swift
//  SwiftNews
//
//  Created by differenz137 on 29/04/21.
//
//MARK: - Author : Hinali Lad

import UIKit

class ArticlesViewController: BaseViewController {
    
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.initialConfig()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.decorateUI()
        
    }
    
}


//MARK: - UIHelpers
extension ArticlesViewController  {
    
    /**
     This method is used to make initial configurations to controls.
     */
    private func initialConfig() {
    }
    
    /**
     This method is used to decorate UI controls.
     */
    private func decorateUI() {
        
        self.setUpNavigationBar(controller: self, navItem: self.navigationItem, navigationTitle: Constants.NavigationBarTitles.Articles)
    }
    
}
