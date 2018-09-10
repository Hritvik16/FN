//
//  API_Client.swift
//  Fake-News
//
//  Created by Hritvik JV on 10/09/18.
//  Copyright © 2018 Hritvik JV. All rights reserved.
//

import Foundation
class API_Client {
    
    func requestHelper(relativePath: String, parameters : [String : String]?) -> URLRequest? {
        guard let url = URLManager.urlMaker(relativePath: relativePath, parameters: parameters) else {
            return nil
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("85a3b8f5a6a34635a0fe1a1ff331cfb4", forHTTPHeaderField: "X-Api-Key")
        return urlRequest
    }
    func topHeadlines() {
        let urlRequest = requestHelper(relativePath: "top-headlines", parameters: nil)
    }
    func everything() {
        let urlRequest = requestHelper(relativePath: "everything", parameters: nil)
    }
    func sources() {
        let urlRequest = requestHelper(relativePath: "sources", parameters: nil)
    }
}
