//
//  ArticleManager.swift
//  Fake-News
//
//  Created by Hritvik JV on 10/09/18.
//  Copyright © 2018 Hritvik JV. All rights reserved.
//

import Foundation

protocol articleManager {
    func initializeTopHeadlines(parameters: [String : String])
    func initializeEverything()
}

class ArticleManager: articleManager {
    
    private var topHeadlines: [Article] = []
    private var everything: [Article] = []
    private let apiClient: API_Client = API_Client()
    
    init(parameters: [String : String]) {
        initializeTopHeadlines(parameters: parameters)
        initializeEverything()
    }
    
    func initializeTopHeadlines(parameters: [String : String]) {
        apiClient.topHeadlines(parameters: parameters) { (articleList) in
            guard let articleList = articleList else {
                return
            }
            self.topHeadLinesConvenienceInit(articles: articleList)
        }
    }
    
    func initializeEverything() {
        apiClient.everything(parameters: ["q" : "us"]) { (articleList) in
            guard let articleList = articleList else {
                return
            }
            self.topHeadLinesConvenienceInit(articles: articleList)
        }
    }
    
    func topHeadLinesConvenienceInit(articles: [Article]) {
        topHeadlines = articles
    }
    
    func everythingConvenienceInit(articles: [Article]) {
        everything = articles
    }
    
    func getTopHeadLines() -> [Article] {
        return topHeadlines
    }
    func getEverything() -> [Article] {
        return everything
    }
}
