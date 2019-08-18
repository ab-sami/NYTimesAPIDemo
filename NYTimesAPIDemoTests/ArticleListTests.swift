//
//  ArticleListTests.swift
//  NYTimesAPIDemoTests
//
//  Created by Abdul Sami on 18/08/2019.
//  Copyright © 2019 Abdul Sami. All rights reserved.
//

import XCTest
@testable import NYTimesAPIDemo

class ArticleListTests: NYTimesAPIDemoTests {
    
    var manager: NewsArticleManager!
    let service: Service = Service()
    let wrongService: Service = Service(url: APIConstants.kBaseUrl, apiKey: "ABC7HJJJJJKDSAJDA")
    let wrongService1: Service = Service(url: APIConstants.kBaseUrl + "t5", apiKey: APIConstants.kAPIKey)
    let fetcher: DataFetcher = DataFetcher()
    var loadExpectation: XCTestExpectation = XCTestExpectation(description: "ArticleListLoad")
    
    override func setUp() {
        super.setUp()
        manager = NewsArticleManager(fetcher: fetcher, service: service)
    }
    
    func testGetArticleList_SuccessCase() {
        manager.getPopularNewsArticles(onSuccess: { (baseArticle) in
            XCTAssertTrue((baseArticle?.articles?.count ?? 0) > 0, "Article List should not be empty.")
            self.loadExpectation.fulfill()
        }, onFailure: { (error) in
            self.loadExpectation.fulfill()
            XCTFail("Article list load failed \(error.debugDescription)")
        })
        wait(for: [loadExpectation], timeout: 10)
    }
    
    func testGetArticleList_WrongAPIKeyCase() {
        let manager1 = NewsArticleManager(fetcher: fetcher, service: wrongService)
        manager1.getPopularNewsArticles(onSuccess: { (baseArticle) in
            XCTFail("Article list load should fail")
            self.loadExpectation.fulfill()
        }, onFailure: { (error) in
            self.loadExpectation.fulfill()
            XCTAssertNotNil(error, "Error can't be nil.")
        })
        wait(for: [loadExpectation], timeout: 10)
    }
    
    func testGetArticleList_WrongAPIURLCase() {
        let manager1 = NewsArticleManager(fetcher: fetcher, service: wrongService1)
        manager1.getPopularNewsArticles(onSuccess: { (baseArticle) in
            XCTFail("Article list load should fail")
            self.loadExpectation.fulfill()
        }, onFailure: { (error) in
            self.loadExpectation.fulfill()
            XCTAssertNotNil(error, "Error can't be nil.")
        })
        wait(for: [loadExpectation], timeout: 10)
    }
}


