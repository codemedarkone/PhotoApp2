//
//  SettingsViewController.swift
//  PhotoApp2
//
//  Created by chris  on 8/2/18.
//  Copyright © 2018 kuronuma studios. All rights reserved.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {

    
    let signOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("SignOut", for: .normal)
        button.backgroundColor = UIColor.blue
        
        button.addTarget(self, action: #selector(signOutTapped), for: .touchUpInside)
        
        return button
    }()
    
    @objc func signOutTapped() {
        
        //sign out using Firebase auth methods
        do {
            try Auth.auth().signOut()
            
            //clear local storage
            LocalStorageService.clearCurrentUser()
            
            //change the window to show the login Screen
            // using constant again
            let navController = UINavigationController(rootViewController: Constanst.Segue.loginViewController )
            present(navController, animated: true, completion: nil)
            

        }
        catch {
            //Error signing out
            print("couldnt Sign out")
        }

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(signOutButton)
        view.backgroundColor = .white
        
        signOutButton.translatesAutoresizingMaskIntoConstraints = false
        signOutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        signOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }


}
