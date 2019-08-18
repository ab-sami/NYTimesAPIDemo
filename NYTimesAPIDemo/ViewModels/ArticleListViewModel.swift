//
//  ArticleListViewModel.swift
//  NYTimesAPIDemo
//
//  Created by Abdul Sami on 17/08/2019.
//  Copyright © 2019 Abdul Sami. All rights reserved.
//

import Foundation

public class ArticleListViewModel: BaseViewModel {
    
    private var apiManager: NewsArticleManager!
    private var articleList: ArticleBase?
    
    init(fetcher: DataFetcher, service: Service) {
        articleList = ArticleBase()
        apiManager = NewsArticleManager(fetcher: fetcher, service: service)
    }
    
    public override func load() {
        super.load()
        guard isReady() == false else { return }
        
        self.apiManager.getPopularNewsArticles(onSuccess: { [unowned self] (articleList) in
            self.articleList = articleList
            self.makeReady()
        }, onFailure: { [weak self] (error) in
            if let error = error {
                self?.throwError(with: error)
            }
        })
    }
    
    public func getArticleListCount() -> Int {
        return self.articleList?.articles?.count ?? 0
    }
    
    public func getRowData(at index: Int) -> Article {
        guard let article = self.articleList?.articles?[safe: index] else {
            return Article()
        }
        return article
    }
    
    public func getArticleTitle(index: Int) -> String {
        guard let article = self.articleList?.articles?[safe: index] else {
            return ""
        }
        return article.title
    }
    
    public func getArticleAuthor(index: Int) -> String {
        guard let article = self.articleList?.articles?[safe: index] else {
            return "By N/A"
        }
        return article.byline.count > 0 ? article.byline : "By N/A"
    }
    
    public func getArticleDate(index: Int) -> String {
        guard let article = self.articleList?.articles?[safe: index] else {
            return ""
        }
        return article.publishedDate
    }
    
    public func getArticleImageURL(index: Int) -> String {
        guard   let article = self.articleList?.articles?[safe: index],
                let media = article.media?[0],
                let metaMedia = media.mediaMetaData?[0] else {
            return ""
        }
        return metaMedia.url ?? ""
    }
    
}
