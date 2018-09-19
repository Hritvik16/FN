//
//  ViewController.swift
//  Fake-News
//
//  Created by Hritvik JV on 05/09/18.
//  Copyright © 2018 Hritvik JV. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let apiClient = API_Client()
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonClick(_ sender: Any) {
        guard let textFieldText = textField.text else {
            return
        }
        let articleManager = ArticleManager(parameters: ["q" : textFieldText])
        var articleList = articleManager.getTopHeadLines()
        while articleList.isEmpty {
            articleList = articleManager.getTopHeadLines()
        }
        
        if let description = articleList[0].description {
            label.text = description
        }
        
        if let imageURL = articleList[0].image {
            URLSession.shared.dataTask(with: imageURL) { data, response, error in
                guard let data = data, let image = UIImage(data: data) else {
                    return
                }
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }.resume()
        }        
    }
}
