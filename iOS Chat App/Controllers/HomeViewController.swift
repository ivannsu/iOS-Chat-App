//
//  HomeViewController.swift
//  iOS Chat App
//
//  Created by Ivan Su on 3/13/19.
//  Copyright © 2019 Ivan Su. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToLoginView", sender: self)
    }
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToRegisterView", sender: self)
    }
}
