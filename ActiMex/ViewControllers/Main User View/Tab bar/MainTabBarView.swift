//
//  MainTabBarView.swift
//  ActiMex
//
//  Created by Manuel Soberanis on 13/04/20.
//  Copyright © 2020 Manuel Soberanis. All rights reserved.
//

import UIKit

class MainTabBarView: UITabBarController {

     override func viewDidLoad() {
            super.viewDidLoad()

    //        self.view.backgroundColor = Theme.current.navBarColor
            self.tabBar.isTranslucent = false
            self.tabBar.backgroundColor = Theme.current.tabBarColor
            self.tabBar.tintColor = Theme.current.backGround
            self.tabBar.barTintColor = Theme.current.tabBarColor
    //        self.tabBar.backgroundImage = UIImage()
    //        self.tabBar.shadowImage = UIImage()
            self.tabBar.barStyle = .default
            self.tabBar.unselectedItemTintColor = Theme.current.viewColor
           
            setupViews()
        }
        
        func setupViews(){
            
            let userViewNavController = MainUserViewNav()
            let categoriesNavView = CategoriesNavView()
            let shopCarNavView = ShopCarNavView()
            let settingsNavView = SettingsNavView()
            
            let userViewItem = UITabBarItem(title: "Home", image: UIImage(named: "Home"), selectedImage: UIImage(named: "Home"))
            let reportsViewItem = UITabBarItem(title: "Reports", image: UIImage(named: "categories"), selectedImage: UIImage(named: "categories"))
            let settingsViewItem = UITabBarItem(title: "Settings", image: UIImage(named: "shoppingCart"), selectedImage: UIImage(named: "shoppingCart"))
            let releasesViewItem = UITabBarItem(title: "City News", image: UIImage(named: "Settings"), selectedImage: UIImage(named: "Settings"))
            
            userViewNavController.tabBarItem = userViewItem
            categoriesNavView.tabBarItem = reportsViewItem
            shopCarNavView.tabBarItem = settingsViewItem
            settingsNavView.tabBarItem = releasesViewItem
            
            let mainUserView = MainUserView()
//            let mainUserView = ProductListCVView()
            let categoriesView = CategoriesView()
            let shopCarView = ShopCarView()
            let settingsView = SettingsView()
            
            userViewNavController.viewControllers = [mainUserView]
            categoriesNavView.viewControllers = [categoriesView]
            shopCarNavView.viewControllers = [shopCarView]
            settingsNavView.viewControllers = [settingsView]
            
            let controllers = [userViewNavController, categoriesNavView, shopCarNavView, settingsNavView]
            
            self.viewControllers = controllers
            
            
            
        }
}//
