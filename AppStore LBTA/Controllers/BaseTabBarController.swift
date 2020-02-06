//
//  BaseTabBarController.swift
//  AppStore LBTA
//
//  Created by Andrew Freitas on 1/9/20.
//  Copyright © 2020 Andrew Freitas. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad(){
        super.viewDidLoad()
        //view.backgroundColor = .yellow
        
        
        viewControllers = [
            createNavController(viewController: AppsPageController(), title: "Apps", imageName: "apps"),
            createNavController(viewController: AppsSearchController(), title: "Search", imageName: "search"),
            createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon")
            
        ]
        

    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        navController.navigationBar.prefersLargeTitles = true
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = title
        let app = UINavigationBarAppearance()
        app.backgroundColor = .white
        navController.navigationBar.scrollEdgeAppearance = app
        
        return navController
        
    }
}
