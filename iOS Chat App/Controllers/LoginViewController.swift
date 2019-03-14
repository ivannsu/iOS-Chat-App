//
//  ViewController.swift
//  iOS Chat App
//
//  Created by Ivan Su on 3/10/19.
//  Copyright © 2019 Ivan Su. All rights reserved.
//

import UIKit
import FirebaseAuth
import SVProgressHUD

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        SVProgressHUD.show()
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!)
        { (authResult, error) in
            if error != nil {
                print("Error sign in user: \(error!)")
                SVProgressHUD.dismiss()
            } else {
                if let authResult = authResult {
                    let user = authResult.user
                    
                    SVProgressHUD.dismiss()
                    self.performSegue(withIdentifier: "goToChatView", sender: self)
                    
                    print("success sign in")
                    print(user.email!)
                    print(user.uid)
                }
            }
        }
    }
    
}

