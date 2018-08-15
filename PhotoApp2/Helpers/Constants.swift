//
//  Constants.swift
//  PhotoApp2
//
//  Created by chris  on 8/15/18.
//  Copyright © 2018 kuronuma studios. All rights reserved.
//

import Foundation


struct Constants {
    
    struct Segue {
        
        static let profileViewController = CreateProfileViewController()
        static let mainTabBarController = MainTabBarController()
        static let loginViewController = LoginViewController()
    }
    
    struct LocalStorage {
        
        static let storedUsername = "storedUsername"
        static let storeUserId = "storedUserId"
    }
}
