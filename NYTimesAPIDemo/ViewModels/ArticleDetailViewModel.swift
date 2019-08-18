//
//  ArticleDetailViewModel.swift
//  NYTimesAPIDemo
//
//  Created by Abdul Sami on 18/08/2019.
//  Copyright © 2019 Abdul Sami. All rights reserved.
//

import Foundation

public class ArticleDetailViewModel: BaseViewModel {
    
    private var articleDetail: Article?
    
    init(article: Article) {
        articleDetail = article
    }
    
    public func getTitle() -> String {
        return articleDetail?.title ?? ""
    }
    
    public func getArticleDescription() -> String {
        return articleDetail?.abstract ?? ""
    }
    
    public func getArticleImageURL() -> String {
        guard   let media = articleDetail?.media?[0] else {
                return ""
        }
        if let metaMedia = media.mediaMetaData?[safe: 1] {
            return metaMedia.url ?? ""
        }
        guard let metaMedia2 = media.mediaMetaData?[safe: 0] else {
            return ""
        }
        return metaMedia2.url ?? ""
    }
    
    public func getArticleAuthor() -> String {
        return (articleDetail?.byline.count ?? 0) > 0 ? articleDetail?.byline ?? "By N/A" : "By N/A"
    }
    
    public func getArticleDate() -> String {
        return articleDetail?.publishedDate ?? ""
    }
    
    public func getArticleSource() -> String {
        return articleDetail?.source ?? ""
    }
    
    public func getArticleWebUrl() -> String {
        return articleDetail?.url ?? ""
    }
}
