//
//  URLManager.swift
//  Fake-News
//
//  Created by Hritvik JV on 10/09/18.
//  Copyright © 2018 Hritvik JV. All rights reserved.
//

import Foundation

class URLManager {
    
    static func urlMaker(relativePath: String, parameters: [String : String]?) -> URL? {
        var urlString = "https://newsapi.org/v2/"
        urlString += relativePath
        if let params = parameters {
            urlString += "?"
            for key in params.keys {
                if let value = params[key] {
                    urlString += "\(key)=\(value)"
                }
            }
        }
        return URL(string: urlString)
    }
}
