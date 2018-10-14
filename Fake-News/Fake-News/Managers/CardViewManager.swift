//
//  CardViewManager.swift
//  Fake-News
//
//  Created by Hritvik JV on 11/10/18.
//  Copyright © 2018 Hritvik JV. All rights reserved.
//

import Foundation
import UIKit

class CardViewManager {
    var cardViews: [CardView] = []
    init() {
        let articleManager = ArticleManager(parameters: ["q" : "us"])
        
        while articleManager.getTopHeadLines().isEmpty {
            //do stuff
        }
        
        let topHeadlines = articleManager.getTopHeadLines()
        
        for article in topHeadlines {
            var i = 0
            let cardView = CardView(frame: CGRect(x: 0, y: 0, width: 375, height: 667))
            cardViews.append(cardView)
                //CardView(article: article, frame: CGRect(x: 0, y: 0, width: 375, height: 667)))
            i += 1
        }
    }
    func nextCard() -> CardView {
        while cardViews.isEmpty {
        }
        return cardViews[0];
    }
}
