//
//  ViewController.swift
//  Youtube
//
//  Created by apple on 10/25/19.
//  Copyright © 2019 thanh. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController , UICollectionViewDelegateFlowLayout {
   let cellid = "cellid"
   let trendingcell = "trendingcell"
   let  supscriptioncell = "supscriptioncell"

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Home"
        navigationController?.navigationBar.isTranslucent = false //mau dam
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "  Home"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        setupcollection()
        setupmenubar()
        setupnavbar()
      
    }

    func setupcollection(){
        
        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.scrollDirection = .horizontal
        }
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .white
        //colection cach top 50
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
//        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: "cellid")
         collectionView.register(BangtinCell.self, forCellWithReuseIdentifier: cellid)
        collectionView.register(TrendingCell.self, forCellWithReuseIdentifier: trendingcell)
        collectionView.register(SupscriptionCell.self, forCellWithReuseIdentifier: supscriptioncell)
    }
    func setupnavbar(){
        let searchButton = UIBarButtonItem(image: UIImage(named: "search_icon")?.withRenderingMode(.alwaysOriginal),style: .plain, target: self, action: #selector(searchAction))
        let moreButton = UIBarButtonItem(image: UIImage(named: "nav_more_icon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(moreAction))
        navigationItem.rightBarButtonItems = [moreButton,searchButton]
    }

     lazy var settinglauncher :  SettingLaucher =  {
        let st = SettingLaucher() //chi goi mot lan
        st.homecontroller = self
        return st
    }()
    
    @objc func searchAction(){
      scrollToMenuIndex(menuIndex: 2)
    }
    
    func scrollToMenuIndex(menuIndex : Int){
        let indexPath = IndexPath(item: menuIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
        
        setTitleForIndex(index: menuIndex)
    }
    
    private func setTitleForIndex(index : Int){
        if let titleLabel = navigationItem.titleView as? UILabel {
            titleLabel.text = "  \(titles[index])"
        }
    }
    
    
    let blackview = UIView()
    @objc func moreAction(){
            self.settinglauncher.showSetting()
    }
    
    
    
    func showControllerForSetting(setting : Setting){
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.white
        vc.navigationItem.title = setting.name.rawValue
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.pushViewController(vc, animated: true)
    }
   
    lazy var menubar : MenuBar = {
        let menu = MenuBar()
        menu.homeController = self
        return menu
    }()
    
    func setupmenubar(){
      //tránh lộ khoảng trắng
        let redview = UIView()
        redview.backgroundColor = UIColor.rgb(red: 194, green: 31, blue: 31)
        view.addSubview(redview)
        redview.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil , trailing: view.trailingAnchor)
        redview.constrainHeight(constant: 50)
        navigationController?.hidesBarsOnSwipe = true
        view.addSubview(menubar)
        menubar.anchor(top: view.safeAreaLayoutGuide.topAnchor , leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        menubar.constrainHeight(constant: 50)
    }

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let indetifier : String
        if indexPath.item == 1 {
            indetifier = trendingcell
        } else if indexPath.item == 2 {
            indetifier = supscriptioncell
        } else  {
            indetifier = cellid
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: indetifier, for: indexPath)
        return cell
    }
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print(scrollView.contentOffset.x)
        menubar.horizontalLeftview?.constant = scrollView.contentOffset.x / 4
    }
    
    let titles = ["Home","Trending","Subscription","Acount"]
    //làm trắng icon scroll trượt
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print(targetContentOffset.pointee.x / view.frame.width)
        let index = targetContentOffset.pointee.x / view.frame.width
        let indexpath = IndexPath(item: Int(index), section: 0)
        menubar.collectionview.selectItem(at: indexpath, animated: true, scrollPosition: .left)
        setTitleForIndex(index: Int(index))
       
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

