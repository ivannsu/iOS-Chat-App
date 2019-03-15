//
//  MessageCell.swift
//  iOS Chat App
//
//  Created by Ivan Su on 3/14/19.
//  Copyright © 2019 Ivan Su. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var senderLabel: UILabel!
    @IBOutlet weak var messageBodyLabel: UILabel!
    @IBOutlet weak var line: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
