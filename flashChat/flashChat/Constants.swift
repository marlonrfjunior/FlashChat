//
//  Constants.swift
//  FlashChat
//
//  Created by Marlon Junior on 29/03/22.
//

import Foundation

struct K {
    
    static let appName = "FlashChat"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageViewCell"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    
    struct BrandColors {
        static let messageReciver = "MessageReciver"
        static let messageSender = "MessageSender"
        static let tile = "Title"
        static let registerBackground = "RegisterBackground"
        static let loginBackground = "LoginBackground"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
        static let hourField = "hour"
        static let seenField = "seen"
    }
    
}
