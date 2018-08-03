//
//  LoginViewController.swift
//  PhotoApp2
//
//  Created by chris  on 8/2/18.
//  Copyright © 2018 kuronuma studios. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(loginButton)

        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.navigationController?.navigationBar.isHidden = true
    }

    let loginButton: UIButton = {
       let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .blue
        
//        button.addTarget(CreateProfileViewController(), action: <#T##Selector#>, for: <#T##UIControlEvents#>)
        return button
    }()
 

    
    
    
}
