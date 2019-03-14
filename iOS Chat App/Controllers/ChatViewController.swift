//
//  ChatViewController.swift
//  iOS Chat App
//
//  Created by Ivan Su on 3/14/19.
//  Copyright © 2019 Ivan Su. All rights reserved.
//

import UIKit
import FirebaseAuth

class ChatViewController: UIViewController {

    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        
        tableView.delegate = self
    }

    @IBAction func signOutButtonPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch {
            print("Error Sign Out: \(error)")
        }
    }
}

extension ChatViewController: UITableViewDelegate {
    
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell", for: indexPath)
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        cell.textLabel?.text = "Hello world"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}
