//
//  CreateProfileViewController.swift
//  PhotoApp2
//
//  Created by chris  on 8/2/18.
//  Copyright © 2018 kuronuma studios. All rights reserved.
//

import UIKit
import FirebaseAuth

class CreateProfileViewController: UIViewController {

    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Set your Username"
        label.textAlignment = .center
        return label
    }()
    
    let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor(white: 0, alpha: 0.03)
        return textField
    }()
    
    let confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("Confirm", for: .normal)
        button.backgroundColor = UIColor.gray
        
        button.addTarget(self, action: #selector(SetUsername), for: .touchUpInside)
        
        return button
    }()
    
    @objc func SetUsername() {
        
        //check that theres a user logged in because we need the uid
        let currentU = Auth.auth().currentUser
        guard currentU != nil else {
            /// no user logged in
            print("no user logged in")
            return
        }
        
        //check that the textfield has a valid name
        let userName = usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard userName != nil && userName != "" else {
            print("Bad username")
            return
        }
        
        //call the user service to create the profile
        UserService.createUserProfile(userId: Auth.auth().currentUser!.uid, username: userName!) { (u) in
            
            //check if the profile was created
            if u == nil {
                //error occured in profile saving
                return
            }
            else {
                
                //save user to local storage
                LocalStorageService.saveCurrentUser(user: u!)
                
                //Go to the tab bar controller
                // Used constant for mainTabBarController for less code here.
                let navController = UINavigationController(rootViewController: Constants.Segue.mainTabBarController)
                self.present(navController, animated: true, completion: nil)
                

            }
            
        }
        //go to the tab bar controller
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(usernameLabel)
        view.addSubview(usernameTextField)
        view.addSubview(confirmButton)
        
        setupInputFields()
        
    }

    func setupInputFields() {
        
        
        let stackView = UIStackView(arrangedSubviews: [usernameLabel, usernameTextField, confirmButton])

        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        
        view.addSubview(stackView)
        
        stackView.anchor(top: nil, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 200)
    
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    

}


