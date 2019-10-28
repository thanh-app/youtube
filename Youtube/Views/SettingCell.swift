//
//  SettingCell.swift
//  Youtube
//
//  Created by apple on 10/26/19.
//  Copyright © 2019 thanh. All rights reserved.
//

import UIKit


class SettingCell : BaseCell {
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = self.isSelected ? UIColor.darkGray : UIColor.white
            namelabel.textColor = self.isSelected ? UIColor.white : UIColor.black
            iconimageView.tintColor = self.isSelected ? UIColor.white : UIColor.darkGray
        }
    }
    
    var setting : Setting? {
      didSet {
        namelabel.text = setting?.name.rawValue
          iconimageView.image  = UIImage(named: self.setting?.iconimage ?? "")?.withRenderingMode(.alwaysTemplate)
          iconimageView.tintColor = UIColor.darkGray
       }
    }
    

    var namelabel : UILabel = {
        let lb = UILabel()
        lb.text = "Setting"
        lb.font = UIFont.systemFont(ofSize: 13)
        return lb
    }()
    
    let iconimageView : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "settings")
        img.contentMode = .scaleAspectFit
        return img
    }()
    override func setupview() {
        super.setupview()
      
       addSubview(namelabel)
       addSubview(iconimageView)
       
        iconimageView.centerYInSuperview()
        iconimageView.constrainWidth(constant: 30)
        iconimageView.constrainHeight(constant: 30)
        iconimageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        namelabel.anchor(top: topAnchor, leading: iconimageView.trailingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: 8, bottom: 0, right: 0), size: .init(width: 0, height: 30))
        
    }
}
