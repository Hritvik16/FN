//
//  API_Client.swift
//  Fake-News
//
//  Created by Hritvik JV on 10/09/18.
//  Copyright © 2018 Hritvik JV. All rights reserved.
//

import Foundation
class API_Client {
    var url = URL(string: "https://newsapi.org/v2/top-headlines?country=us")!
    
    func requestHelper(relativePath: String) -> URLRequest? {
        guard let url = URL(string: "https://newsapi.org/v2/\(relativePath)") else {
            return nil
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("85a3b8f5a6a34635a0fe1a1ff331cfb4", forHTTPHeaderField: "X-Api-Key")
        return urlRequest
    }
    func topHeadlines() {
        let urlRequest = requestHelper(relativePath: "top-headlines")
    }
    func everything() {
        let urlRequest = requestHelper(relativePath: "everything")
    }
    func sources() {
        let urlRequest = requestHelper(relativePath: "sources")
    }
}
