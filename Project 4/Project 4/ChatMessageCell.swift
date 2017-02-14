//
//  ChatMessageCell.swift
//  Project 4
//
//  Created by Benjamin Landau on 2/11/17.
//  Copyright © 2017 Benjamin Landau. All rights reserved.
//

import UIKit

class ChatMessageCell: UICollectionViewCell {
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.text = "some text"
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = UIColor.clear
        tv.textColor = UIColor.white
        tv.font = UIFont.systemFont(ofSize: 16)
        return tv
    }()
    
    static let blueColor = UIColor(r: 0, g: 137, b: 249)
    
    let bubbleView: UIView = {
        let view = UIView()
        view.backgroundColor = blueColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        return view
    }()
    
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "joel-embiid-76ers-heat")
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var bubbleWidthAnchor: NSLayoutConstraint?
    var bubbleViewRightAnchor: NSLayoutConstraint?
    var bubbleViewLeftAnchor: NSLayoutConstraint?
  override init(frame: CGRect) {
    super.init(frame: frame)
    
        addSubview(bubbleView)
        addSubview(textView)
        addSubview(profileImageView)
    profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
    profileImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    profileImageView.heightAnchor.constraint(equalToConstant: 32).isActive = true
    profileImageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
   // textView.text = "some text"
    textView.textColor = UIColor.white
    
    bubbleViewRightAnchor = bubbleView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8)
    bubbleViewRightAnchor?.isActive = true
    bubbleViewLeftAnchor = bubbleView.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 8)
    bubbleView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    
    bubbleWidthAnchor = bubbleView.widthAnchor.constraint(equalToConstant: 200)
    bubbleWidthAnchor?.isActive = true
    bubbleView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    
    
//    textView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    textView.leftAnchor.constraint(equalTo: bubbleView.leftAnchor, constant: 8).isActive = true
    textView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//    textView.widthAnchor.constraint(equalToConstant: 200).isActive = true
    textView.rightAnchor.constraint(equalTo: bubbleView.rightAnchor).isActive = true
    textView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
