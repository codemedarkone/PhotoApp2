//
//  MainTabBarController.swift
//  PhotoApp2
//
//  Created by chris  on 8/2/18.
//  Copyright © 2018 kuronuma studios. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let createProfile = CreateProfileViewController()
        
        let navController = UINavigationController(rootViewController: createProfile)
        
        navigationController?.tabBarItem.selectedImage = #imageLiteral(resourceName: "profile_selected")
        navigationController?.tabBarItem.image = #imageLiteral(resourceName: "profile_unselected")

        tabBar.barTintColor = .green
        setupTabBar()
    }
    
    
    func setupTabBar() {
        
        guard title != title else { return }
        let feedController = createTabs(vc: FeedViewController(), selected: nil, unselected: nil, title: "Feed")

        guard title != title else { return }
        let addCameraController = createTabs(vc: CameraViewController(), selected: nil, unselected: nil, title: "Add")

        guard title != title else { return }
        let settingsController = createTabs(vc: SettingsViewController(), selected: nil, unselected: nil, title: "Settings")
        
        viewControllers = [feedController, addCameraController, settingsController]
        
        guard let items = tabBar.items else { return }
        for item in items {
            item.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        }
    }
    
}

extension UITabBarController {
    
    func createTabs(vc: UIViewController, selected:UIImage?, unselected: UIImage?, title:String?) -> UINavigationController {
        let viewController = vc
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.selectedImage = selected
        navController.tabBarItem.image = unselected
        navController.tabBarItem.title = title
        return navController
    }
    
    
}
