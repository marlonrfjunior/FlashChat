//
//  MessageCell.swift
//  FlashChat
//
//  Created by Marlon Junior on 30/03/22.
//

import UIKit

class MessageReciveCell: UITableViewCell {

    @IBOutlet weak var messageViewReciveCell: UIView!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
