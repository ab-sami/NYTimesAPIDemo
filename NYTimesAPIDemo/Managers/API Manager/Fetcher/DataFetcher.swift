//
//  DataFetcher.swift
//  NYTimesAPIDemo
//
//  Created by Abdul Sami on 17/08/2019.
//  Copyright © 2019 Abdul Sami. All rights reserved.
//

import Foundation

class DataFetcher {
    
    public init() {
    }
    
    //DataRequest->Decodable
    func run<T:Decodable> (_ request:URLRequest, onSuccess: @escaping (T)->(), onFailure: @escaping ErrorCall) {
        
        self.run(request, onSuccess: { (data) in
            do {
                let decodable = try JSONDecoder().decode(T.self, from: data)
                onSuccess(decodable)
            }
            catch {
                #if DEBUG
                let string = String(data: data, encoding: String.Encoding.utf8) ?? "No decodable response received"
                print("❗️Request: \(String(describing: request.url))")
                print("❗️Response: \(string)")
                print("❗️Decoding Error Occurred!" )
                print(error)
                #endif
                onFailure(error)
            }
        }, onFailure: { (error) in
            onFailure(error)
        })
    }
    
    //DataRequest->RawData
    func run(_ request:URLRequest, onSuccess: @escaping DataCall, onFailure: @escaping ErrorCall) {
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                return onFailure(error)
            }
            //Success
            if let data = data {
                onSuccess(data)
            }
            }.resume()
    }
}
