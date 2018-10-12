//
//  ArticleItem.swift
//  Fake-News
//
//  Created by Hritvik JV on 10/09/18.
//  Copyright © 2018 Hritvik JV. All rights reserved.
//

import Foundation
import UIKit

class Article {
    let source: (Any, String)?
    let author: String?
    let title: String?
    let description: String?
    let url: URL?
    let image: URL?
    let publishDate: String?
    
    init(source: (Any, String)?,
         author: String?,
         title: String?,
         description: String?,
         url: URL? = nil,
         imageUrl: URL?,
         publishDate: String?) {
        self.source = source
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.image = imageUrl
        self.publishDate = publishDate
    }
}
