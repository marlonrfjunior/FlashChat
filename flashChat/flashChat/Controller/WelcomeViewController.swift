//
//  ViewController.swift
//  FlashChat
//
//  Created by Marlon Junior on 24/03/22.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = ""
        var index = 0.0
        for str in K.appName {
            Timer.scheduledTimer(withTimeInterval: 0.1 * index, repeats: false){ timer in self.titleLabel.text?.append(str)
            }
            index+=1
        }
    }
    
    
}

