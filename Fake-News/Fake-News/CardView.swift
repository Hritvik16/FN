//
//  CardView.swift
//  Fake-News
//
//  Created by Hritvik JV on 11/10/18.
//  Copyright © 2018 Hritvik JV. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    let article: Article
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        
        let articleManager = ArticleManager(parameters: ["q " : "trump"])
        article = articleManager.nextArticle()
        
        super.init(coder: aDecoder)
        
        setup(article: article)
    }
    
    override init(frame: CGRect) {
        
        let articleManager = ArticleManager(parameters: ["q " : "trump"])
        article = articleManager.nextArticle()
        
        super.init(frame: frame)
        
        setup(article: article)
    }
    
    func setup(article: Article) {
        
        Bundle.main.loadNibNamed("CardView", owner: self, options: nil)
        addSubview(cardView)
        cardView.frame = self.bounds
        cardView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        if let url = article.image {
            imageView.load(url: url)
        }
        label.text = article.description
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
