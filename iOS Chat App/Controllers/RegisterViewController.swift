//
//  RegisterViewController.swift
//  iOS Chat App
//
//  Created by Ivan Su on 3/13/19.
//  Copyright © 2019 Ivan Su. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToChatView", sender: self)
    }
    
}
