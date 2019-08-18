//
//  MediaMeta.swift
//  NYTimesAPIDemo
//
//  Created by Abdul Sami on 17/08/2019.
//  Copyright © 2019 Abdul Sami. All rights reserved.
//

import Foundation

class MediaMeta: Decodable {
    
    var url: String?
    var format: String?
    var height: Int
    var width: Int
    
    private enum CodingKeys: String, CodingKey {
        case url, format, height, width
    }
    
    init() {
        url = ""
        format = ""
        height = 0
        width = 0
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        url = try? container.decode(String.self, forKey: .url)
        format = try? container.decode(String.self, forKey: .format)
        height = try container.decode(Int.self, forKey: .height)
        width = try container.decode(Int.self, forKey: .width)
    }
}
