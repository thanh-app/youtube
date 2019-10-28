//
//  AppDelegate.swift
//  Youtube
//
//  Created by apple on 10/25/19.
//  Copyright © 2019 thanh. All rights reserved.
//

import UIKit

//trắng thanh pin
 class LightNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let layout = UICollectionViewFlowLayout()
        window?.rootViewController = LightNavigationController(rootViewController: HomeController(collectionViewLayout: layout))
        UINavigationBar.appearance().barTintColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        
        //thoát khỏi thanh màu đen bên dưới thanh nav
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        
        //màu sắc cho thanh pin
        let statusBarBackgroundView = UIView()
        statusBarBackgroundView.backgroundColor = UIColor.rgb(red: 194, green: 31, blue: 31)
        window?.addSubview(statusBarBackgroundView)
        statusBarBackgroundView.anchor(top: window?.topAnchor, leading: window?.leadingAnchor, bottom: nil, trailing: window?.trailingAnchor)
        statusBarBackgroundView.constrainHeight(constant: 20)
        return true
    }

}

