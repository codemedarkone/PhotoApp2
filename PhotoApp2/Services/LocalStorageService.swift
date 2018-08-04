//
//  LocalStorageService.swift
//  PhotoApp2
//
//  Created by chris  on 8/3/18.
//  Copyright © 2018 kuronuma studios. All rights reserved.
//

import Foundation


class LocalStorageService {
    
    static func saveCurrentUser(user:PhotoUser) {
        
        //Get standard user defaults
        let defaults = UserDefaults.standard
        
        defaults.set(user.userId, forKey: Constanst.LocalStorage.storedUserId)
        defaults.set(user.username, forKey: Constanst.LocalStorage.storedUsername)
    }
    
    static func loadCurrentUser() -> PhotoUser? {
        
        //Get standard user defaults
        let defaults = UserDefaults.standard
        
        let username = defaults.value(forKey: Constanst.LocalStorage.storedUsername) as? String
        let userId = defaults.value(forKey: Constanst.LocalStorage.storedUserId) as? String
        
        // couldnt get user, return nil
        guard username != nil || userId != nil else {
            return nil
        }
        
        //Return the user
        let u = PhotoUser(username: username, userId: userId)
        return u
    }
    
    static func clearCurrentUser() {
        
        let defaults = UserDefaults.standard
        
        defaults.set(nil, forKey: Constanst.LocalStorage.storedUserId)
        defaults.set(nil, forKey: Constanst.LocalStorage.storedUsername)
    }
    
}
