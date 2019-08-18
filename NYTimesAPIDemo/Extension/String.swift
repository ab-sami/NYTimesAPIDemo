//
//  String.swift
//  NYTimesAPIDemo
//
//  Created by Abdul Sami on 17/08/2019.
//  Copyright © 2019 Abdul Sami. All rights reserved.
//

import Foundation
import UIKit

extension String {
    public func escape()->String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
    }
    
    public func concat(urlPath:String)->String {
        return self + (self.hasSuffix("/") ? "" : "/") +  urlPath
    }
    
    func img() -> UIImage {
        return UIImage(named: self) ?? UIImage()
    }
}
