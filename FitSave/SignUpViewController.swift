//
//  SignUpViewController.swift
//  FitSave
//
//  Created by Gaeun Kim on 3/25/17.
//  Copyright © 2017 HSHacks Team. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"LoginBackground")!)
        
        // Fitsave label
        let fitsaveLabel = UILabel(frame: CGRect(x: 0, y: 123, width: 375, height: 41))
        fitsaveLabel.textAlignment = .center
        fitsaveLabel.text = "FitSave"
        fitsaveLabel.font = UIFont(name: "OpenSans", size: 30)
        fitsaveLabel.textColor = UIColor.white
        self.view.addSubview(fitsaveLabel)
        
        // Email address label
        let emailLabel = UILabel(frame: CGRect(x: 32, y: 244, width: 300, height: 24))
        emailLabel.text = "EMAIL ADDRESS"
        emailLabel.font = UIFont(name: "OpenSans", size: 18)
        emailLabel.textColor = UIColor.white
        self.view.addSubview(emailLabel)
        
        // Email address text field
        let emailTextField = UITextField(frame: CGRect(x: 32, y: 278, width: 310, height: 41))
        emailTextField.placeholder = "Enter email address"
        emailTextField.font = UIFont(name: "OpenSans", size: 18)
        emailTextField.borderStyle = UITextBorderStyle.roundedRect
        emailTextField.backgroundColor = UIColor.white
        self.view.addSubview(emailTextField)
        
        // Password label
        let passwordLabel = UILabel(frame: CGRect(x: 33, y: 356, width: 300, height: 24))
        passwordLabel.text = "PASSWORD"
        passwordLabel.font = UIFont(name: "OpenSans", size: 18)
        passwordLabel.textColor = UIColor.white
        self.view.addSubview(passwordLabel)
        
        // Password text field
        let passwordTextField = UITextField(frame: CGRect(x: 33, y: 390, width: 310, height: 41))
        passwordTextField.placeholder = "Enter password"
        passwordTextField.font = UIFont(name: "OpenSans", size: 18)
        passwordTextField.borderStyle = UITextBorderStyle.roundedRect
        passwordTextField.backgroundColor = UIColor.white
        self.view.addSubview(passwordTextField)
        
        // Login Button
        let loginButton: UIButton = UIButton(frame: CGRect(x: 75, y: 538, width: 71, height: 30))
        loginButton.setTitle("LOGIN", for: .normal)
        loginButton.titleLabel!.font = UIFont(name: "OpenSans", size: 22)
        loginButton.titleLabel!.textColor = UIColor.white
        loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        self.view.addSubview(loginButton)
        
        // Signup Button
        let signupButton: UIButton = UIButton(frame: CGRect(x: 216, y: 538, width: 90, height: 30))
        signupButton.setTitle("SIGNUP", for: .normal)
        signupButton.titleLabel!.font = UIFont(name: "OpenSans", size: 22)
        signupButton.titleLabel!.textColor = UIColor.white
        signupButton.addTarget(self, action: #selector(signupButtonAction), for: .touchUpInside)
        self.view.addSubview(signupButton)
    }
    
    func loginButtonAction(sender: UIButton!) {
        
    }
    
    func signupButtonAction(sender: UIButton!) {
        
    }
    
    
}
