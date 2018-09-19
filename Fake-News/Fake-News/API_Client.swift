//
//  API_Client.swift
//  Fake-News
//
//  Created by Hritvik JV on 10/09/18.
//  Copyright © 2018 Hritvik JV. All rights reserved.
//

import Foundation
import UIKit

class API_Client {
    
    func requestHelper(relativePath: String, parameters : [String : String]?) -> URLRequest? {
        guard let url = URLManager.urlMaker(relativePath: relativePath, parameters: parameters) else {
            return nil
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("85a3b8f5a6a34635a0fe1a1ff331cfb4", forHTTPHeaderField: "X-Api-Key")
        return urlRequest
    }
    
    func articleURL(string: String?) -> URL? {
        guard let string = string, let url = URL(string: string) else {
            return nil
        }
        return url
    }
    
    func imageURL(string: String?) -> URL? {
        guard let string = string, let url = URL(string: string) else {
            return nil
        }
        return url
    }
    
    func articleImage(string: String?, dataCompletionHandler: @escaping (UIImage?, Error?) -> Void) {
        guard let string = string, let url = URL(string: string) else {
            return
        }
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil, let image = UIImage(data: data) else {
                return
            }
            dataCompletionHandler(image, error)
        }.resume()
    }
    
    func topHeadlines(parameters : [String : String], dataCompletionhandler: @escaping ([Article]?) -> Void) {
        guard let urlRequest = requestHelper(relativePath: "top-headlines", parameters: parameters) else {
            return
        }
        var articleList: [Article] = []
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else {
                    return
            }
            let jsonObject = try? JSONSerialization.jsonObject(with: data, options: [])
            guard let jsonDict = jsonObject as? [String : Any],
                let articles = jsonDict["articles"] as? [Any], !articles.isEmpty else {
                return
            }
            for article in articles {
                guard let articleDict = article as? [String : Any] else {
                    continue
                }
                articleList.append(Article(source: articleDict["source"] as? (Any, String),
                                           author: articleDict["author"] as? String,
                                           title: articleDict["title"] as? String,
                                           description: articleDict["description"] as? String,
                                           url: self.articleURL(string: articleDict["url"] as? String),
                                           imageUrl: self.imageURL(string: articleDict["urlToImage"] as? String),
                                           publishDate: articleDict["publishedAt"] as? String))
            }
                dataCompletionhandler(articleList)
            
        }.resume()
        
        dataCompletionhandler(articleList)
    }
    func getTopHeadlines(completion: () ->()) {
        
    }
    func everything(parameters : [String : String], dataCompletionhandler: @escaping ([Article]?) -> Void) {
        guard let urlRequest = requestHelper(relativePath: "everything", parameters: parameters) else {
            return
        }
        var articleList: [Article] = []
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else {
                return
            }
            let jsonObject = try? JSONSerialization.jsonObject(with: data, options: [])
            guard let jsonDict = jsonObject as? [String : Any],
                let articles = jsonDict["articles"] as? [Any], !articles.isEmpty else {
                    return
            }
            for article in articles {
                guard let articleDict = article as? [String : Any] else {
                    continue
                }
                var image: UIImage? = nil
                self.articleImage(string: articleDict["urlToImage"] as? String, dataCompletionHandler: { imageData, error in
                    
                })
                
                articleList.append(Article(source: articleDict["source"] as? (Any, String),
                                           author: articleDict["author"] as? String,
                                           title: articleDict["title"] as? String,
                                           description: articleDict["description"] as? String,
                                           url: self.articleURL(string: articleDict["url"] as? String),
                                           imageUrl: self.imageURL(string: articleDict["urlToImage"] as? String),
                                           publishDate: articleDict["publishedAt"] as? String))
            }
            dataCompletionhandler(articleList)
            
            }.resume()
        
        dataCompletionhandler(articleList)
    }
    
    func sources() {
        let urlRequest = requestHelper(relativePath: "sources", parameters: nil)
    }
}
