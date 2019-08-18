//
//  ArticleBase.swift
//  NYTimesAPIDemo
//
//  Created by Abdul Sami on 17/08/2019.
//  Copyright © 2019 Abdul Sami. All rights reserved.
//

import Foundation

public class ArticleBase: Decodable {
    
    var status: String
    var copyright: String
    var noOfResults: Int
    var articles: [Article]?
    
    private enum CodingKeys: String, CodingKey {
        case status, copyright, noOfResults = "num_results", articles = "results"
    }
    
    init() {
        status = ""
        copyright = ""
        noOfResults = 0
        articles = [Article]()
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decode(String.self, forKey: .status)
        copyright = try container.decode(String.self, forKey: .copyright)
        noOfResults = try container.decode(Int.self, forKey: .noOfResults)
        articles = try? container.decode([Article].self, forKey: .articles)
    }
    
}
