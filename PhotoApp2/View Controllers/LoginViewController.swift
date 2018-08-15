//
//  LoginViewController.swift
//  PhotoApp2
//
//  Created by chris  on 8/2/18.
//  Copyright © 2018 kuronuma studios. All rights reserved.
//

import UIKit
import FirebaseUI


class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(loginButton)

        logButton()
     
    }
    
    func logButton(){
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loginButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        loginButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    let loginButton: UIButton = {
       let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = UIColor.rgb(red: 149, green: 204, blue: 244)
        button.layer.cornerRadius = 3
        button.addTarget(CreateProfileViewController(), action: #selector(loginTapped), for: .touchUpInside)
        
        return button
    }()
    
    
 
    @objc func loginTapped() {
    
        // Create a firebase auth ui object
        let authUI = FUIAuth.defaultAuthUI()
        
        //check that it isn't nil
        if let authUI = authUI {
            
            // Create a firebase auth pre build UI View Controller
            let authViewController = authUI.authViewController()
            
            //set the login view Controller as the delegate
            authUI.delegate = self
            
            //present it
            present(authViewController, animated: true, completion: nil)
        }
    }
    
    
    
}

extension LoginViewController: FUIAuthDelegate {
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        
        //check if an error occured
        guard error == nil else {
            print("An error has happened")
            return
        }
        
        // Get the user
        let user = authDataResult?.user
        
        // check if user is nil and create user
        if let user = user {
            
            //This means that we have a user, now check if they have a profile
            
            UserService.getUserProfile(userId: user.uid) { (photoUser) in
                
                
                if photoUser == nil {
                    //no profile, go to profile controller
                    //used the Constant struct for less lines of code.
                    
                    let navController = UINavigationController(rootViewController: Constants.Segue.profileViewController)
                    self.present(navController, animated: true, completion: nil)
                }
                else {
                    //save the logged in user to local storage
                    LocalStorageService.saveCurrentUser(user: photoUser!)
                    
                    // This user has a profile, go to tab controller
                    //did not use constans
                    
                    let mainTabVC = MainTabBarController()
                    let navController = UINavigationController(rootViewController: mainTabVC)
                    self.present(navController, animated: true, completion: nil)

                    self.view.window?.rootViewController = navController
                    self.view.window?.makeKeyAndVisible()
                }
            }

        }
    }
}
