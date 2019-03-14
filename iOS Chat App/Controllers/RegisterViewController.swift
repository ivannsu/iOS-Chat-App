//
//  RegisterViewController.swift
//  iOS Chat App
//
//  Created by Ivan Su on 3/13/19.
//  Copyright © 2019 Ivan Su. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        SVProgressHUD.show()
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) {
                (authResult, error) in
                
                if error != nil {
                    print("Error register new user: \(error!)")
                    SVProgressHUD.dismiss()
                } else {
                    print("Success register new user...")
                    
                    SVProgressHUD.dismiss()
                    self.performSegue(withIdentifier: "goToChatView", sender: self)
                }
            }
        } else {
            print("Email or Password is empty!")
        }
    }
    
}
