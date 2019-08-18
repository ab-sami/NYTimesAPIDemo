//
//  Service.swift
//  NYTimesAPIDemo
//
//  Created by Abdul Sami on 17/08/2019.
//  Copyright © 2019 Abdul Sami. All rights reserved.
//

import Foundation

internal class Service {
    private var apiUrl:String
    private var apiKey: String
    
    init(url: String = APIConstants.kBaseUrl, apiKey: String = APIConstants.kAPIKey) {
        self.apiUrl = url
        self.apiKey = apiKey
    }
    
    func getPopularNewsArticlesRequest() -> URLRequest? {
        apiUrl = apiUrl.concat(urlPath: "svc/mostpopular/v2/viewed/1.json")
        let dataRequest = DataRequest(url: apiUrl)
        dataRequest.addQueryParameter(key: "api-key", value: self.apiKey)
        guard let request = dataRequest.createURLRequest() else {
            return nil
        }
        return request
    }
}
