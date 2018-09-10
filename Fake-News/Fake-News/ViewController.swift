//
//  ViewController.swift
//  Fake-News
//
//  Created by Hritvik JV on 05/09/18.
//  Copyright © 2018 Hritvik JV. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us")!
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("85a3b8f5a6a34635a0fe1a1ff331cfb4", forHTTPHeaderField: "X-Api-Key")
        var text = ""
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data
                else {
                return
            }
//                let decoder = JSONDecoder()
//                let info = try? decoder.decode(params.self, from: data)
            let jsonObject = try? JSONSerialization.jsonObject(with: data, options: [])
            guard let jsonDict = jsonObject as? [String : Any] else {
                    return
            }
            guard let articles = jsonDict["articles"] as? [Any] else {
                return
            }
            guard let articleInfo = articles[0] as? [String : Any] else {
                return
            }
            guard let description = articleInfo["description"] as? String else {
                return
                
            }
            DispatchQueue.main.async {
                self.textField.text = description
            }
        }.resume()
    }
    
    // Do any additional setup after loading the view, typically from a nib.
}
