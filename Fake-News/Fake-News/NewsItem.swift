//
//  NewsItem.swift
//  Fake-News
//
//  Created by Hritvik JV on 10/09/18.
//  Copyright © 2018 Hritvik JV. All rights reserved.
//

import Foundation

protocol newsItem {
    var sources : [String] { get set }
    var articles : [String] { get }
}
