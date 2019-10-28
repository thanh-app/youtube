//
//  MenuBar.swift
//  Youtube
//
//  Created by apple on 10/25/19.
//  Copyright © 2019 thanh. All rights reserved.
//

import UIKit



class MenuBar : UIView , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
   
    
    
   lazy var collectionview : UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    let cellid = "cellid"
    let imagename = ["home","trending","subscriptions","account"]
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionview)
        collectionview.fillSuperview()
        collectionview.register(Menucell.self, forCellWithReuseIdentifier: cellid)
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionview.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .bottom)
        
       setupHorizontalBar()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var horizontalLeftview :  NSLayoutConstraint?
    
    func setupHorizontalBar(){
        let horizontalview = UIView()
        horizontalview.backgroundColor = UIColor(white: 0.9, alpha: 1)
        addSubview(horizontalview)
        horizontalview.anchor(top: nil, leading: nil, bottom: bottomAnchor, trailing: nil)
        horizontalview.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/4).isActive = true
        horizontalview.constrainHeight(constant: 4)
        self.horizontalLeftview = horizontalview.leftAnchor.constraint(equalTo: self.leftAnchor)
        horizontalLeftview?.isActive = true
    }
    
    var homeController : HomeController?
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let x = CGFloat(indexPath.item) * frame.width/4
//        horizontalLeftview?.constant = x
//        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
//            self.layoutIfNeeded()
//        }, completion: nil)
        homeController?.scrollToMenuIndex(menuIndex: indexPath.item)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagename.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! Menucell
        cell.imageView.image = UIImage(named: imagename[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/4, height: frame.height)
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}



class Menucell : BaseCell {
    
    let imageView : UIImageView = {
        let img  = UIImageView()
        img.image = UIImage(named: "home")?.withRenderingMode(.alwaysTemplate)
        img.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13)
        return img
    }()

    override var isSelected : Bool {
        didSet {
            imageView.tintColor = isSelected ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)
        }
    }
    
    override func setupview() {
        super.setupview()
        addSubview(imageView)
        imageView.centerInSuperview()
        imageView.constrainWidth(constant: 28)
        imageView.constrainHeight(constant: 28)
        
    }
    
}
