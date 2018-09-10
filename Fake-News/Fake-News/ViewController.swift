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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonClick(_ sender: Any) {
        guard let textFieldText = textField.text else {
            return
        }
        guard let urlRequest = apiClient.requestHelper(relativePath: "everything", parameters: nil) else {
            return
        }
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
                self.label.text = description
            }
            }.resume()
    }
}
