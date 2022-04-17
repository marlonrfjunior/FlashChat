//
//  ChatViewController.swift
//  FlashChat
//
//  Created by Marlon Junior on 25/03/22.
//

import UIKit
import Firebase
import SwiftUI

class ChatViewController : UIViewController{
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    
    let dbMessage = Firestore.firestore()
    
 
    var messages : [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        title = "Chat"
        navigationItem.hidesBackButton = true
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        loadMessages()
    }
    
    func loadMessages() {
        dbMessage.collection(K.FStore.collectionName)
                    .order(by: K.FStore.dateField)
                    .addSnapshotListener{( querySnapshot, error) in
                        
            self.messages = []
                        
            if let e = error{
                print("Some error ocurred: \(e)" )
            }
            else{
                if let snapshot = querySnapshot?.documents{
                    for doc in snapshot {
                        let data = doc.data()
                        if let messageSender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String, let messageHour = data[K.FStore.hourField] as? String{
                            self.messages.append(Message(sender: messageSender, body: messageBody, hour: messageHour, seen: true))
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                self.tableView.scrollToRow(
                                    at: IndexPath(item: self.messages.count-1, section:0),
                                    at: .top,
                                    animated: true)
                            }
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email{
            let formatter = DateFormatter()
            formatter.dateFormat = "hh:mm a" 
            let hourString = formatter.string(from: Date())
            dbMessage.collection(K.FStore.collectionName).addDocument(data:
                [K.FStore.bodyField : messageBody,
                 K.FStore.senderField : messageSender,
                 K.FStore.dateField : Date.timeIntervalSinceReferenceDate,
                 K.FStore.hourField : hourString]) { (Error) in
                if let e = Error{
                    
                        DispatchQueue.main.async {
                    self.messageTextfield.placeholder = e.localizedDescription
                        }
                }
                else{
                    DispatchQueue.main.async {
                        self.messageTextfield.text=""
                        self.messageTextfield.placeholder = "Type something..."
                    }
                }
            }
        }
        
    }
    
    @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        
    }
    
}
// MARK: - UiTableViewDataSource

extension ChatViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        as! MessageViewCell
        cell.bodyTextLabel.text = message.body
        cell.hourTextLabel.text = message.hour
        
        if message.sender == Auth.auth().currentUser?.email {
            cell.rigthView.isHidden = true
            cell.messageBubleView.backgroundColor = UIColor(named:K.BrandColors.messageSender)
        }else{
            cell.leftView.isHidden = true
            cell.messageBubleView.backgroundColor = UIColor(named: K.BrandColors.messageReciver)
        }
        
        return cell
    }
    
}


