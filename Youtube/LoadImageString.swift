//
//  LoadImageString.swift
//  Youtube
//
//  Created by apple on 10/25/19.
//  Copyright © 2019 thanh. All rights reserved.
//

import UIKit


var imageCache = [String: UIImage]()

class CustomImageView: UIImageView {
    
    var imageUrlString: String?
    
    func loadImageString(url : String){
        //neu co hinh anh tu cache thi :
        if let imagefromCache = imageCache[url] {
            self.image = imagefromCache
            return
        }
        imageUrlString = url
        image = nil
        guard let url = URL(string: url) else {return}
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {return}
            if url.absoluteString != self.imageUrlString {
                return
            }
            let imagetoCache = UIImage(data: data)
            imageCache[url.absoluteString] =  imagetoCache
            DispatchQueue.main.sync {
                self.image = imagetoCache
            }
        }.resume()
    }
}

