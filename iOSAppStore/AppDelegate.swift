//
//  AppDelegate.swift
//  iOSAppStore
//
//  Created by Ky Nguyen on 3/20/19.
//  Copyright © 2019 Ky Nguyen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        setupApp()
        return true
    }

    func setupApp() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = BaseTabBarController()
        window?.makeKeyAndVisible()
    }

}

