//
//  TrendingCell.swift
//  Youtube
//
//  Created by apple on 10/28/19.
//  Copyright © 2019 thanh. All rights reserved.
//

import UIKit

class TrendingCell: BangtinCell {
    override func fetchvideo() {
        ApiService.sharedInstance.fetchTrendingFeed { (videos) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }

}
