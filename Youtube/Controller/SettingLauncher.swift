//
//  SettingLauncher.swift
//  Youtube
//
//  Created by apple on 10/26/19.
//  Copyright © 2019 thanh. All rights reserved.
//

import UIKit


class SettingLaucher : NSObject , UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    var homecontroller : HomeController?
    
    let settings : [Setting] = {
        let setting = Setting(name: .setting, iconimage: "settings")
        let send = Setting(name: .send, iconimage: "feedback")
        let  help = Setting(name: .helps, iconimage: "help")
        let terms = Setting(name: .terms, iconimage: "privacy")
        let switchAccount = Setting(name: .switchAccount, iconimage: "switch_account")
        let cancel = Setting(name: .cancel, iconimage: "cancel")
        return [setting,terms,send,help,switchAccount,cancel]
    }()
    
    let collectionview : UICollectionView = {
        let cvl = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cvl.backgroundColor = UIColor.white
        return cvl
    }()
    
    let blackview = UIView()
    
    let cellid = "cellid"
    let cellheight : CGFloat = 50
    func showSetting(){
        
        if let window = UIApplication.shared.keyWindow {
            blackview.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissAction)))
            blackview.backgroundColor = UIColor(white: 0, alpha: 0.5)
            window.addSubview(blackview)
            window.addSubview(collectionview)
            let height : CGFloat  = CGFloat(settings.count) * cellheight
            let y = window.frame.height - height
            collectionview.frame = CGRect(x: 0, y: window.frame.height , width: window.frame.width , height: height)
            blackview.frame = window.frame
            blackview.alpha = 0
            
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackview.alpha = 1
                self.collectionview.frame = CGRect(x: 0, y: y, width: window.frame.width, height: height)
              }, completion: nil)
        }
    }
    
    @objc func dismissAction(){
        UIView.animate(withDuration: 0.5) {
            self.blackview.alpha = 0
            if let window = UIApplication.shared.keyWindow {
                self.collectionview.frame = CGRect(x: 0, y: window.frame.height, width: self.collectionview.frame.width, height: self.collectionview.frame.height)
            }
        }
        
    }
    
    override init() {
        super.init()
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(SettingCell.self, forCellWithReuseIdentifier: cellid)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.settings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! SettingCell
        cell.setting = settings[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:self.collectionview.frame.width, height: cellheight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          let setting = self.settings[indexPath.row]
       handledismiss(setting: setting)
    }
    
    
    func handledismiss(setting : Setting) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut , animations:
            {
                self.blackview.alpha = 0
                if let window = UIApplication.shared.keyWindow {
                    self.collectionview.frame = CGRect(x: 0, y: window.frame.height, width: self.collectionview.frame.width, height: self.collectionview.frame.height)
            }
        }) { (completed : Bool) in
              if setting.name != .cancel {
                self.homecontroller?.showControllerForSetting(setting: setting)
           }
        }
    }
}
