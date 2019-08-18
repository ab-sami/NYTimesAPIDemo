//
//  Article.swift
//  NYTimesAPIDemo
//
//  Created by Abdul Sami on 17/08/2019.
//  Copyright © 2019 Abdul Sami. All rights reserved.
//

import Foundation

public class Article: Decodable {
    
    var url: String
    var keywords: String
    var column: String?
    var section: String
    var byline: String
    var type: String
    var title: String
    var abstract: String
    var publishedDate: String
    var source: String
    var id: Int64
    var assetId: Int64
    var views: Int
    var desFacet: [String]?
    var orgFacet: String?
    var perFacet: [String]?
    var geoFacet: [String]?
    var uri: String
    var media: [Media]?
    
    private enum CodingKeys: String, CodingKey {
        case    url, keywords = "adx_keywords", column, section, byline, type, title, abstract,
                publishedDate = "published_date", source, id, assetId = "asset_id", views, desFacet = "des_facet",
                orgFacet = "org_facet", perFacet = "per_facet", geoFacet = "geo_facet", uri, media
    }
    
    public init() {
        url = ""
        keywords = ""
        column = ""
        section = ""
        byline = ""
        type = ""
        title = ""
        abstract = ""
        publishedDate = ""
        source = ""
        id = 0
        assetId = 0
        views = 0
        desFacet = []
        orgFacet = ""
        perFacet = []
        geoFacet = []
        uri = ""
        media = [Media]()
    }
    
    required public init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        url = try container.decode(String.self, forKey: .url)
        keywords = try container.decode(String.self, forKey: .keywords)
        column = try? container.decode(String.self, forKey: .column)
        section = try container.decode(String.self, forKey: .section)
        byline = try container.decode(String.self, forKey: .byline)
        type = try container.decode(String.self, forKey: .type)
        title = try container.decode(String.self, forKey: .title)
        abstract = try container.decode(String.self, forKey: .abstract)
        publishedDate = try container.decode(String.self, forKey: .publishedDate)
        source = try container.decode(String.self, forKey: .source)
        id = try container.decode(Int64.self, forKey: .id)
        assetId = try container.decode(Int64.self, forKey: .assetId)
        views = try container.decode(Int.self, forKey: .id)
        desFacet = try? container.decode([String].self, forKey: .desFacet)
        orgFacet = try? container.decode(String.self, forKey: .orgFacet)
        perFacet = try? container.decode([String].self, forKey: .perFacet)
        geoFacet = try? container.decode([String].self, forKey: .geoFacet)
        uri = try container.decode(String.self, forKey: .uri)
        media = try? container.decode([Media].self, forKey: .media)
    }
}


