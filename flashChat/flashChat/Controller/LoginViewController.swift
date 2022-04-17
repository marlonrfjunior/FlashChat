//
//  LoginViewController.swift
//  FlashChat
//
//  Created by Marlon Junior on 25/03/22.
//

import UIKit
import Firebase

class LoginViewController: UIViewController{
    
    @IBOutlet weak var emailTextFieldLogin: UITextField!
    @IBOutlet weak var passwordTextFieldLogin: UITextField!
    @IBOutlet weak var errorLabelLogin: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextFieldLogin.text,let password = passwordTextFieldLogin.text{
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error{
                    self.errorLabelLogin.text = e.localizedDescription
                }else{
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
        
    }
    
}
