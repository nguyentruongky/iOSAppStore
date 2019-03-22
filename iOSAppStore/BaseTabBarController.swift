//
//  BaseTabBarController.swift
//  iOSAppStore
//
//  Created by Ky Nguyen on 3/20/19.
//  Copyright © 2019 Ky Nguyen. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let todayController = UIViewController()
        todayController.view.backgroundColor = .green
        todayController.navigationItem.title = "Today"

        let todayNav = wrapToNavigation(controller: todayController, tabBarTitle: "Today", iconName: "today")


        let appsController = AppsPageController()
        appsController.navigationItem.title = "Apps"
        let appsNav = wrapToNavigation(controller: appsController, tabBarTitle: "Apps", iconName: "apps")


        let searchController = AppsSearchController()
        searchController.navigationItem.title = "Search"

        let searchNav = wrapToNavigation(controller: searchController, tabBarTitle: "Search", iconName: "search")


        viewControllers = [
            appsNav,
            todayNav,
            searchNav,
        ]
    }

    func wrapToNavigation(controller: UIViewController,
                          tabBarTitle: String, iconName: String) -> UINavigationController {
        let nav = UINavigationController(rootViewController: controller)
        nav.tabBarItem.title = tabBarTitle
        nav.tabBarItem.image = UIImage(named: iconName)
        nav.navigationBar.prefersLargeTitles = true
        return nav
    }
}
