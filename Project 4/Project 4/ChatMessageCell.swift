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
    
    let bubbleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 0, g: 137, b: 249)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        return view
    }()
    
    var bubbleWidthAnchor: NSLayoutConstraint?
    
  override init(frame: CGRect) {
    super.init(frame: frame)
    
        addSubview(bubbleView)
        addSubview(textView)
    
   // textView.text = "some text"
    textView.textColor = UIColor.white
    bubbleView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
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
