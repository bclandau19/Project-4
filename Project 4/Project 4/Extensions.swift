//
//  Extensions.swift
//  Project 4
//
//  Created by Benjamin Landau on 2/7/17.
//  Copyright © 2017 Benjamin Landau. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    
    func loadImageUsingCacheWithUrlString(UrlString: AnyObject) {
        self.image = nil
        if let cachedImage = imageCache.object(forKey: UrlString)  as? UIImage {
            self.image = cachedImage
            return
        }
        let url = URL(string: UrlString as! String)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async {
                if let downloadedImage = UIImage(data: data!) {
                    imageCache.setObject(downloadedImage, forKey: UrlString)
                       self.image = UIImage(data: data!)
                }
            }
        }.resume()
    }
    
    
    
    
}
