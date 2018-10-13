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
    
//    func getImage(dataCompletionhandler: @escaping (UIImage?) -> Void) {
//        guard let url = url else {
//            return
//        }
//        let urlRequest = URLRequest(url: url)
//
//        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
//            guard let data = data else {
//                dataCompletionhandler(nil)
//                return
//            }
//
//            let image = UIImage(data: data)
//                dataCompletionhandler(image)
//
//        }.resume()
//    }
    func getImage() {
        
    }
}




