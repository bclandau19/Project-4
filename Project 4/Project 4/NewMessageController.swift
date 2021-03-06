//
//  NewMessageController.swift
//  Project 4
//
//  Created by Benjamin Landau on 2/4/17.
//  Copyright © 2017 Benjamin Landau. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class NewMessageController: UITableViewController {
    
    
    var users = [User]()
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UserCell.self, forCellReuseIdentifier: cellId)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        fetchUser()
    }
    
    func fetchUser() {
        FIRDatabase.database().reference().child("Users").observe(.childAdded, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String : AnyObject] {
                let user = User()
                user.id = snapshot.key
                user.setValuesForKeys(dictionary)
                self.users.append(user)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            print(snapshot)
        }, withCancel: nil)
    }
    
    
    func handleCancel() {
       dismiss(animated: true, completion: nil)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! UserCell
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email
        if let profileImageURL = user.profileImageURL {
        cell.profileImageView.loadImageUsingCacheWithUrlString(UrlString: profileImageURL as AnyObject)
        }
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
    
    var messagesController: MessagesController?
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true) {
            let user = self.users[indexPath.row]
           self.messagesController?.showChatControllerForUser(user: user)
        }
    }
}


