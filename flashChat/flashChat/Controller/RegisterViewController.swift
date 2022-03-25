//
//  RegisterViewController.swift
//  FlashChat
//
//  Created by Marlon Junior on 25/03/22.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextFieldRegister: UITextField!
    @IBOutlet weak var passwordTextFieldRegister: UITextField!
    @IBOutlet weak var errorRegisterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        let email = emailTextFieldRegister.text!
        let password = passwordTextFieldRegister.text!
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let e = error {
                self.errorRegisterLabel.text = e.localizedDescription
            }
            else{
                self.performSegue(withIdentifier: "RegisterToChat", sender: self)
            }
        }
    }
    
}


