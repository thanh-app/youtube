//
//  VideoCell.swift
//  Youtube
//
//  Created by apple on 10/25/19.
//  Copyright © 2019 thanh. All rights reserved.
//

import UIKit

class VideoCell: BaseCell {
    
    var video : Video? {
        didSet {
            setupthumbnailImage()
            setupUserProfileImage()
            titleLabel.text = video?.title
            if let channelname = video?.channel?.name , let numberofviews = video?.numberOfViews {
                let numberfomater = NumberFormatter()
                numberfomater.numberStyle = .decimal
                let subtitleText =  "\(channelname) - \(numberfomater.string(from: NSNumber(value: numberofviews))!) — 2 years ago"
                subtitleTextView.text = subtitleText
            }
        }
    }
    
    func setupUserProfileImage(){
        self.userProfileImageView.loadImageString(url: video?.channel?.profileImageName ?? "")
    }
    func setupthumbnailImage(){
        thumbnailImageView.loadImageString(url: video?.thumbnailImageName ?? "")
    }
    
    let thumbnailImageView : CustomImageView = {
        let img  = CustomImageView()
        img.image = UIImage(named: "taylor_swift_blank_space")
        img.contentMode = .scaleAspectFill
        img.layer.masksToBounds = true
        return img
    }()
    
    let separatorView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 230, green: 230, blue: 230)
        return view
    }()
    
    let userProfileImageView : CustomImageView = {
        let img = CustomImageView()
        img.image = UIImage(named: "taylor_swift_profile")
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 44/2
        img.layer.masksToBounds = true
        //        img.backgroundColor = UIColor.green
        return img
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        //        label.backgroundColor = UIColor.purple
        label.text = "Taylor Swift - Blank Space"
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        return label
    }()
    
    let subtitleTextView : UITextView = {
        let tv = UITextView()
        //        tv.backgroundColor = UIColor.red
        tv.text = "TaylorSwiftEvo - 1,694,567,789 views - 2 years ago"
        tv.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        tv.font = UIFont.systemFont(ofSize: 12)
        tv.textColor = UIColor.lightGray
        return tv
    }()
    

    override func setupview(){
        super.setupview()
        addSubview(thumbnailImageView)
        addSubview(self.separatorView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        thumbnailImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16), size: .zero)
        userProfileImageView.anchor(top: thumbnailImageView.bottomAnchor, leading: thumbnailImageView.leadingAnchor, bottom: separatorView.topAnchor, trailing: nil, padding: .init(top: 8, left: 0, bottom: 16, right: 0), size: .init(width: 44, height: 44))
        titleLabel.anchor(top: thumbnailImageView.bottomAnchor, leading: userProfileImageView.trailingAnchor, bottom: nil, trailing: thumbnailImageView.trailingAnchor, padding: .init(top: 8, left: 8, bottom: 0, right: 0), size: .init(width: 0, height: 20))
        subtitleTextView.anchor(top: titleLabel.bottomAnchor, leading: titleLabel.leadingAnchor, bottom: nil, trailing: titleLabel.trailingAnchor, padding: .init(top: 4, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 30))
        separatorView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        separatorView.constrainHeight(constant: 1)
    }
}
