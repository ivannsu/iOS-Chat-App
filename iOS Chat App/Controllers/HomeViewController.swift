//
//  HomeViewController.swift
//  iOS Chat App
//
//  Created by Ivan Su on 3/13/19.
//  Copyright © 2019 Ivan Su. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let currentUser = Auth.auth().currentUser
        
        if currentUser != nil {
            if let currentUser = currentUser {
                print(currentUser.email!)
                performSegue(withIdentifier: "goToChatView", sender: self)
            }
        }
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToLoginView", sender: self)
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToRegisterView", sender: self)
    }
}
