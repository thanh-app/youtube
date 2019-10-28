//
//  Video.swift
//  Youtube
//
//  Created by apple on 10/25/19.
//  Copyright © 2019 thanh. All rights reserved.
//

import UIKit


struct Video: Decodable {
    
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: Int?
    var uploadDate: Date?
    var channel: Channel?
    
}

struct Channel: Decodable {
    var name: String?
    var profileImageName: String?
}
