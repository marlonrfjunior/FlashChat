//
//  MessageViewCell.swift
//  FlashChat
//
//  Created by Marlon Junior on 31/03/22.
//

import UIKit

class MessageViewCell: UITableViewCell {

    
    @IBOutlet weak var messageBubleView: UIView!
    @IBOutlet weak var bodyTextLabel: UILabel!
    @IBOutlet weak var hourTextLabel: UILabel!
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var rigthView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        messageBubleView.layer.cornerRadius = 15.0
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
