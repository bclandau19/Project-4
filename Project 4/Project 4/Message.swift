//
//  Message.swift
//  Project 4
//
//  Created by Benjamin Landau on 2/9/17.
//  Copyright © 2017 Benjamin Landau. All rights reserved.
//

import UIKit
import Firebase

class Message: NSObject {
    
    var fromID: String?
    var text: String?
    var timeStamp: NSNumber?
    var toID: String?
    
    func chatPartnerId() -> String? {
        return  fromID == FIRAuth.auth()?.currentUser?.uid ? toID : fromID
    }
}
