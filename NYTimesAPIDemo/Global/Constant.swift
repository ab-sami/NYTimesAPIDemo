//
//  Constant.swift
//  NYTimesAPIDemo
//
//  Created by Abdul Sami on 17/08/2019.
//  Copyright © 2019 Abdul Sami. All rights reserved.
//

import Foundation

struct APIConstants {
    static let kBaseUrl = "https://api.nytimes.com/"
    static let kAPIKey = "kV3MAuhzApxqem5InX80IMUR4yGQINPP"
}

struct Headers {
    static var defaultHeaders: [String : String] {
        return ["Accept" : "application/json",
                "Content-Type" : "application/json"]
    }
}

enum LoadingPosition {
    case top, bottom, middle
}
