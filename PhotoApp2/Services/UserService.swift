//
//  UserService.swift
//  PhotoApp2
//
//  Created by chris  on 8/3/18.
//  Copyright © 2018 kuronuma studios. All rights reserved.
//

import Foundation
import FirebaseDatabase


class UserService {
    
    static func createUserProfile(userId:String, username:String, completion: @escaping (PhotoUser?) -> Void ) -> Void {
        
        //Create a dictionary for the user profile
        let userProfileData = ["username": username]
        
        // Get a database reference
        let ref = Database.database().reference()
        
        //Create the profile for the user id
        ref.child("users").child(userId).setValue(userProfileData) { (error, ref) in
            
            if error != nil {
                // There was an error
                completion(nil)
            }
            else {
                //create the user and pass it back
                let u = PhotoUser(username: username, userId: userId)
                completion(u)
            }
        }
    }
    
    
    static func getUserProfile(userId: String, completion: @escaping (PhotoUser?) -> Void ) -> Void {
        
        //Get a Database Reference
        let ref = Database.database().reference()
        
        // Try to retreve the Profile for the passed userId
        ref.child("users").child(userId).observeSingleEvent(of: .value) { (snapshot) in
            
            //check the return snapshot value to see if there is a profile
            if let userProfileData = snapshot.value as? [String: Any] {
                
                //This means there is a profile
                //Create a photo user with the profile details
                var photoUser = PhotoUser()
                photoUser.userId = snapshot.key
                photoUser.username = userProfileData["username"] as? String
                
                //pass it into the completion closure
                completion(photoUser)
                
            }
            else {
                
                //This means there wasn't a Profile
                //Return nil
                completion(nil)
            }
            
        }
        
    }
    
}
