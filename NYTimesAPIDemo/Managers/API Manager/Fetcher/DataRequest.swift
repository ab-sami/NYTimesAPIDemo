//
//  DataRequest.swift
//  NYTimesAPIDemo
//
//  Created by Abdul Sami on 17/08/2019.
//  Copyright © 2019 Abdul Sami. All rights reserved.
//

import Foundation

public class DataRequest: URLRequestDelegate {
    
    public static let DefaultCachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalCacheData
    public static let DefaultTimeOutIterval:TimeInterval = 30
    
    public var url:String
    public var headers:[String : String]
    public var method: String
    
    convenience init(url:String, method: String = "GET", headers: [String : String]? = Headers.defaultHeaders) {
        self.init(url: url, method: method, defaultHeaders: headers)
    }
    
    private init(url:String, method: String, defaultHeaders: [String : String]? = nil) {
        self.url = url
        self.method = method
        self.headers = defaultHeaders ?? [:]
    }
    
    func addQueryParameter(key:String?, value:String?) {
        guard let value = value else {
            return
        }
        
        guard let key = key else {
            return
        }
        
        let queryString = key + "=" + value.escape()
        url = url + (url.contains("?") ? "&" : "?") + queryString
    }
    
    func createURLRequest() -> URLRequest? {
        guard let safeUrl = URL(string: url) else{ return nil }
        
        var request: URLRequest = URLRequest(url: safeUrl, cachePolicy: DataRequest.DefaultCachePolicy, timeoutInterval: DataRequest.DefaultTimeOutIterval)
        request.allHTTPHeaderFields = headers
        request.httpMethod = "GET"
        return request
    }
}

protocol URLRequestDelegate: class {
    func createURLRequest() -> URLRequest?
}
