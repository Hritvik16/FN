//
//  ViewController.swift
//  Fake-News
//
//  Created by Hritvik JV on 05/09/18.
//  Copyright © 2018 Hritvik JV. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cardView: CardView!
    
    
    let apiClient = API_Client()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cardViewManager = CardViewManager()
        cardView = cardViewManager.initializeCardViews()
    }
//    @IBAction func swipeRecognizer(_ sender: UIPanGestureRecognizer) {
//        guard let card = sender.view else {
//            return
//        }
//        let point = sender.translation(in: view)
//        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
//    }
}
