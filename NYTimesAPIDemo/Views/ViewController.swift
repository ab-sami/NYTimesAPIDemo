//
//  ViewController.swift
//  NYTimesAPIDemo
//
//  Created by Abdul Sami on 17/08/2019.
//  Copyright © 2019 Abdul Sami. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BaseViewModelDelegate {

    @IBOutlet weak var tableView: UITableView!

    private var fetcher: DataFetcher!
    private var service: Service!
    private let simpleCellId = "simpleCell"
    var viewModel: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViewModel()
        setUpView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        loadData()
    }

    func setUpViewModel() {
        fetcher = DataFetcher()
        service = Service()
        viewModel = ArticleListViewModel(fetcher: fetcher, service: service)
        viewModel.delegate = self
    }
    
    func setUpView() {
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    @objc func loadData() {
        LoadingView.shared.show(self)
        viewModel.load()
    }
    
    //MARK:- Base view model delegate
    
    func onViewModelReady(_ viewModel: BaseViewModel) {
        DispatchQueue.main.async { [weak self] in
            LoadingView.shared.hide()
            self?.tableView.reloadData()
        }
    }
    
    func onViewModelError(_ viewModel: BaseViewModel, error: Error) {
        DispatchQueue.main.async { [weak self] in
            LoadingView.shared.hide()
            self?.handleError()
        }
    }
    
    func handleError() {
        let alertView = UIAlertController(title: "Error!!", message: "OOPS! An error occured. Pull down to refresh again.", preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            alertView.dismiss(animated: true, completion: nil)
        }))
        self.present(alertView, animated: true, completion: nil)
    }
    
    func navigateToDetailScreen(articleData: Article) {
        performSegue(withIdentifier: "articleDetail", sender: articleData)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let articlesDetailVC = segue.destination as? ArticleDetailViewController {
            if let article = sender as? Article {
                let articleViewModel = ArticleDetailViewModel(article: article)
                articlesDetailVC.viewModel = articleViewModel
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getArticleListCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: simpleCellId, for: indexPath) as! ArticleTableViewCell
        cell.titleLabel.text = viewModel.getArticleTitle(index: indexPath.row)
        cell.byLabel.text = viewModel.getArticleAuthor(index: indexPath.row)
        cell.publishedDateLabel.text = viewModel.getArticleDate(index: indexPath.row)
        cell.articleImageView.loadImageUsingUrlString(viewModel.getArticleImageURL(index: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let articleDetailData = viewModel.getRowData(at: indexPath.row)
        navigateToDetailScreen(articleData: articleDetailData)
    }
}

