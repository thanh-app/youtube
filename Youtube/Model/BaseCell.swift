//
//  BaseCell.swift
//  Youtube
//
//  Created by apple on 10/25/19.
//  Copyright © 2019 thanh. All rights reserved.
//

import UIKit

class BaseCell : UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    func setupview(){
    
    }
    
}
