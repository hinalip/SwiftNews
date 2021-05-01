//
//  ArticlesViewController.swift
//  SwiftNews
//
//  Created by differenz137 on 29/04/21.
//
//MARK: - Author : Hinali Lad

import UIKit

class ArticlesViewController: BaseViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var tblArticles : UITableView!
    
    //MARK: - Private Variables
    private var news = News(dict: [:])
    
    //Referesh Control
    let refreshControl = UIRefreshControl()
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.initialConfig()
        
        self.getArticleList()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.decorateUI()
        
    }
    
}

//MARK: - Selector Methods
extension ArticlesViewController  {
    
    @objc private func onRefreshTableView() {
        
        self.getArticleList(showLoader: false, isRefreshing: true)
    }
}


//MARK: - UIHelpers
extension ArticlesViewController  {
    
    /**
     This method is used to make initial configurations to controls.
     */
    private func initialConfig() {
        
        self.tblArticles.register(ArticleCell.self)
        self.tblArticles.delegate = self
        self.tblArticles.dataSource = self
        
        self.refreshControl.addTarget(self, action: #selector(self.onRefreshTableView), for: .valueChanged)
        self.tblArticles.addSubview(self.refreshControl)
    }
    
    /**
     This method is used to decorate UI controls.
     */
    private func decorateUI() {
        
        self.setUpNavigationBar(controller: self, navItem: self.navigationItem, isBackButtonEnabled : false, navigationTitle: Constants.NavigationBarTitles.Articles)
    }
    
}

//MARK: - UITableViewDelegate,UITableViewDataSource
extension ArticlesViewController : UITableViewDelegate,UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.news?.newsData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : ArticleCell = tableView.dequeueReusableCell(for: indexPath)
        
        if let article = self.news?.newsData?[indexPath.row].childrenData {
            
            cell.lblTitle.text = article.articleTitle
            
            if article.thumbNail.isEmpty == false && article.thumbNail.isValidUrl() {
                
                cell.imgVwThumbnail.isHidden = false
                cell.nslcImgThumbnailHeight.constant = getImageviewHeight(inputHeight: article.thumbNailHeight)
                cell.imgVwThumbnail.setImageFromURL(url: article.thumbNail)
                
                
            } else {
                
                cell.imgVwThumbnail.isHidden = true
            }
            
            cell.reloadCollectionView(awardings: article.allAwardings ?? [])
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let article = self.news?.newsData?[indexPath.row].childrenData {
            
            let vc = self.storyboard?.getViewController(with: VCIdentifiers.kArticleDetailsViewController) as! ArticleDetailsViewController
            vc.article = article
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}


//MARK: - API Calls
extension ArticlesViewController  {
    
    /**
     This method is used to  is used to call service API for gettng list of articles.
     */
    private func getArticleList(showLoader : Bool = true, isRefreshing : Bool = false) {
    
        News.getArticles(showLoader: showLoader) { (totalCount, message, news) in
            
            if isRefreshing {
                self.refreshControl.endRefreshing()
            }
            
            self.news = news
            
            if self.news?.newsData?.count ?? 0 > 0 {
                self.unloadNoDataFoundView()
            } else {
                self.loadNoDataFoundView(parentView: self.tblArticles,message: message)
            }
            
            self.tblArticles.reloadData()
            
        } failure: { (statusCode, errorMessage) in
            
            if isRefreshing {
                self.refreshControl.endRefreshing()
            }
            
            self.loadNoDataFoundView(parentView: self.tblArticles,message: errorMessage)
        }
        
    }
}
