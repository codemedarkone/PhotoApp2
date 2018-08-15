//
//  MainTabBarController.swift
//  PhotoApp2
//
//  Created by chris  on 8/2/18.
//  Copyright © 2018 kuronuma studios. All rights reserved.
//

import UIKit
import Firebase


class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        let index = viewControllers?.index(of: viewController)
        if index == 1 {

            let cameraViewController = CameraViewController()
            let navController = UINavigationController(rootViewController: cameraViewController)
            present(navController, animated: true, completion: nil)
            return false
        }
        
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        if Auth.auth().currentUser == nil {
            //show if not logged in
            DispatchQueue.main.async {
                
                let loginController = Constants.Segue.loginViewController
                let navController = UINavigationController(rootViewController: loginController)
                self.present(navController, animated: true, completion: nil)
            }
            return
        }

       
        setupTabBar()
    }
    
    
    func setupTabBar() {
        
        
        
        let feedController = createTabs(vc: FeedViewController(), selected: nil, unselected: nil, title: "Feed", rootViewController: FeedViewController())

        
        let cameraController = createTabs(vc: CameraViewController(), selected: nil, unselected: nil, title: "Add")

        
        let settingsController = createTabs(vc: SettingsViewController(), selected: nil, unselected: nil, title: "Settings")

        view.backgroundColor = .white
        tabBar.barTintColor = .green
        tabBar.tintColor = .red
        
        viewControllers = [feedController,
                           cameraController,
                           settingsController]
        
        guard let items = tabBar.items else { return }
        for item in items {
            item.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        }
    }
    
}

extension UITabBarController {
    
    //func to make creating tabBars easier
    func createTabs(vc: UIViewController, selected:UIImage?, unselected: UIImage?, title:String?, rootViewController: UIViewController = UIViewController()) -> UINavigationController {
        let viewController = vc
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.selectedImage = selected
        navController.tabBarItem.image = unselected
        navController.tabBarItem.title = title
        return navController
    }
    
    
}
