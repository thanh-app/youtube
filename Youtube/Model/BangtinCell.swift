//
//  BangtinCell.swift
//  Youtube
//
//  Created by apple on 10/28/19.
//  Copyright © 2019 thanh. All rights reserved.
//

import UIKit

class BangtinCell : BaseCell , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.dataSource = self
        cv.delegate = self
        return cv
        
    }()
    
    var videos : [Video]?
    
    func fetchvideo(){
        ApiService.sharedInstance.fetchVideos { (videos) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
    
    let cellid = "cellid"
    override func setupview() {
        super.setupview()
        addSubview(collectionView)
        collectionView.fillSuperview()
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: cellid)
        fetchvideo()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! VideoCell
        
        cell.video = videos?[indexPath.row]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (frame.width - 16 - 16) * 9 / 16
        return CGSize(width: frame.width, height: height + 16 + 88)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
