//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by oliver naser on 9/1/17.
//  Copyright © 2017 oliver naser. All rights reserved.
//
// Comment

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    
    var index = 0
    
    // This code executes when the view controller loads
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func messageButtonPressed(_ sender: Any) {
        
        let messages = ["Pickles", "Greece", "Hoop", "Gyros", "Manny"]
        
    
        messageLabel.text = messages[index]
        index = index + 1
        
        if index == messages.count {
            index = 0
        }
        
//        let message1 = "Pickles"
//        let message2 = "Greece"
//        let message3 = "Hoop"
//
//        if messageLabel.text == message1 {
//             messageLabel.text = message2
//        } else if  messageLabel.text == message2 {
//            messageLabel.text = message3
//        } else {
//            messageLabel.text = message1
//        }
    }
}


