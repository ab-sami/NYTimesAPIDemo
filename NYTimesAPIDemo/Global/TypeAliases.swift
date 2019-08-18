//
//  TypeAliases.swift
//  NYTimesAPIDemo
//
//  Created by Abdul Sami on 17/08/2019.
//  Copyright © 2019 Abdul Sami. All rights reserved.
//

import Foundation

public typealias ErrorCall = (Error?)->()
public typealias SimpleCall = ()->(Void)
public typealias DataCall = (Data)->()
public typealias ArticleListCall = (ArticleBase?) -> ()
