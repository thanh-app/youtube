//
//  Supscription.swift
//  Youtube
//
//  Created by apple on 10/28/19.
//  Copyright © 2019 thanh. All rights reserved.
//

import UIKit

class SupscriptionCell: BangtinCell {
    
    override func fetchvideo() {
        ApiService.sharedInstance.fetchSubscriprionFeed { (videos) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
}
