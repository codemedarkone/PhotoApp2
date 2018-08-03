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
    }
    
    
    func setupTabBar() {
        
        let feedController = UINavigationController(rootViewController: FeedViewController())
        feedController.tabBarItem.image = #imageLiteral(resourceName: "home_unselected")
        feedController.tabBarItem.selectedImage = #imageLiteral(resourceName: "home_selected")
        
        let addCameraController = UINavigationController(rootViewController: CameraViewController())
        addCameraController.tabBarItem.image = #imageLiteral(resourceName: "plus_unselected")
        addCameraController.tabBarItem.selectedImage = #imageLiteral(resourceName: "plus_photo")
        
        let settingsController = UINavigationController(rootViewController: SettingsViewController())
        
    }
    
}
