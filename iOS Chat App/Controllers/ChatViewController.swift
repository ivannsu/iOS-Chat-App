//
//  ChatViewController.swift
//  iOS Chat App
//
//  Created by Ivan Su on 3/14/19.
//  Copyright © 2019 Ivan Su. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class ChatViewController: UIViewController {
    
    private var messagesData: [Message] = [Message]()
    
    // Firebase Realtime Database
    private let ref: DatabaseReference = Database.database().reference()
    
    @IBOutlet weak var messagesTableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // seedData()
        retriveData()
        
        navigationItem.setHidesBackButton(true, animated: false)
        
        messagesTableView.delegate = self
        messagesTableView.dataSource = self
        messagesTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "messageCell")
        
        messagesTableView.separatorStyle = .none
        messagesTableView.rowHeight = UITableView.automaticDimension
        messagesTableView.estimatedRowHeight = 100.0
    }
    
    func seedData() {
        
        let newMessage1 = Message(sender: "user1", messageBody: "hello user2")
        let newMessage2 = Message(sender: "user2", messageBody: "hello user1")
        let newMessage3 = Message(sender: "user3", messageBody: "hello user1 and user2")
        
        messagesData.append(newMessage1)
        messagesData.append(newMessage2)
        messagesData.append(newMessage3)
       
    }
    
    func retriveData() {
        let messageDB = Database.database().reference().child("messages")
        
        messageDB.observe(.childAdded) { (snapshot) in
            let snapshotValue = snapshot.value as! Dictionary<String, String>
            let email = snapshotValue["email"]
            let messageBody = snapshotValue["messageBody"]
            
            let message = Message(sender: email!, messageBody: messageBody!)
            
            self.messagesData.append(message)
            self.messagesTableView.reloadData()
            // self.configureTableView()
        }
    }
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        if let user = Auth.auth().currentUser {
            let message = [
                "email": user.email,
                "messageBody": messageTextField.text!
            ]
            
            messageTextField.isEnabled = false
            sendButton.isEnabled = false
            
            ref.child("messages").childByAutoId().setValue(message) {
                (error, result) in
                if let error = error {
                    print("Error sending message: \(error)")
                } else {
                    print("success sending message")
                }
                
                self.messageTextField.isEnabled = true
                self.messageTextField.text = ""
                self.sendButton.isEnabled = true
            }
        }
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

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessageCell
        
        cell.container.layer.cornerRadius = 10
        cell.senderLabel.text = messagesData[indexPath.row].sender
        cell.messageBodyLabel.text = messagesData[indexPath.row].messageBody
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesData.count
    }
}
