//
//  Media.swift
//  NYTimesAPIDemo
//
//  Created by Abdul Sami on 17/08/2019.
//  Copyright © 2019 Abdul Sami. All rights reserved.
//

import Foundation

class Media: Decodable {
    
    var type: String
    var subtype: String
    var caption: String?
    var copyright: String
    var approvedForSyndication: Int
    var mediaMetaData: [MediaMeta]?
    
    private enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright, approvedForSyndication = "approved_for_syndication", mediaMetaData = "media-metadata"
    }
    
    init() {
        type = ""
        subtype = ""
        caption = ""
        copyright = ""
        approvedForSyndication = 0
        mediaMetaData = [MediaMeta]()
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(String.self, forKey: .type)
        subtype = try container.decode(String.self, forKey: .subtype)
        caption = try? container.decode(String.self, forKey: .caption)
        copyright = try container.decode(String.self, forKey: .copyright)
        approvedForSyndication = try container.decode(Int.self, forKey: .approvedForSyndication)
        mediaMetaData = try? container.decode([MediaMeta].self, forKey: .mediaMetaData)
    }
}
