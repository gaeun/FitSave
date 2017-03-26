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
    
    var emailTextField: UITextField = UITextField(frame: CGRect(x: 32, y: 278, width: 310, height: 41))
    var passwordTextField: UITextField = UITextField(frame: CGRect(x: 33, y: 390, width: 310, height: 41))
    
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
        
        
        
        // Password label
        let passwordLabel = UILabel(frame: CGRect(x: 33, y: 356, width: 300, height: 24))
        passwordLabel.text = "PASSWORD"
        passwordLabel.font = UIFont(name: "OpenSans", size: 18)
        passwordLabel.textColor = UIColor.white
        self.view.addSubview(passwordLabel)
        
        
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Email address text field
        //let emailTextField = UITextField(frame: CGRect(x: 32, y: 278, width: 310, height: 41))
        self.view.addSubview(emailTextField)
        emailTextField.placeholder = "Enter email address"
        emailTextField.font = UIFont(name: "OpenSans", size: 18)
        emailTextField.borderStyle = UITextBorderStyle.roundedRect
        emailTextField.backgroundColor = UIColor.white
        
        // Password text field
        //let passwordTextField = UITextField(frame: CGRect(x: 33, y: 390, width: 310, height: 41))
        passwordTextField.placeholder = "Enter password"
        passwordTextField.font = UIFont(name: "OpenSans", size: 18)
        passwordTextField.borderStyle = UITextBorderStyle.roundedRect
        passwordTextField.backgroundColor = UIColor.white
        self.view.addSubview(passwordTextField)
        print("came here")
    }
    
    
    func loginButtonAction(sender: UIButton!) {
        if self.emailTextField.text == "" || self.passwordTextField.text == "" {
            
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            FIRAuth.auth()?.signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { (user, error) in
                
                if error == nil {
                    
                    //Print into the console if successfully logged in
                    print("You have successfully logged in")
                    
                    //Go to the HomeViewController if the login is sucessful
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    
                    //Tells the user that there is an error and then gets firebase to tell them the error
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    func signupButtonAction(sender: UIButton!) {
        if emailTextField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            FIRAuth.auth()?.createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
                
                if error == nil {
                    print("You have successfully signed up")
                    //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                    
                    // let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    // self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    
}
