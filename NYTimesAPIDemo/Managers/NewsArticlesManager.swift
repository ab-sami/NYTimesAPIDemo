//
//  NewsArticlesManager.swift
//  NYTimesAPIDemo
//
//  Created by Abdul Sami on 17/08/2019.
//  Copyright © 2019 Abdul Sami. All rights reserved.
//

import Foundation


public class NewsArticleManager {
    
    private let fetcher:DataFetcher!
    private let service:Service!
    
    internal init(fetcher: DataFetcher, service: Service) {
        self.fetcher = fetcher
        self.service = service
    }
    
    func getPopularNewsArticles(onSuccess: @escaping ArticleListCall, onFailure: @escaping ErrorCall) {
        guard let request = service.getPopularNewsArticlesRequest() else { return }
        
        fetcher.run(request, onSuccess: { (articleList: ArticleBase) in
            onSuccess(articleList)
        }, onFailure:  { (error) in
            onFailure(error)
        })
    }
}
