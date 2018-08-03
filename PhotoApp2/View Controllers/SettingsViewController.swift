//
//  SettingsViewController.swift
//  PhotoApp2
//
//  Created by chris  on 8/2/18.
//  Copyright © 2018 kuronuma studios. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    let signOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("SignOut", for: .normal)
        button.backgroundColor = UIColor.blue
        
//        button.addTarget(self, action: #selector(signOutButton), for: .touchUpInside)
        
        return button
    }()
    
    func signOutButton() {
        print(123)
        
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
