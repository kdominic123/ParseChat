//
//  LoginViewController.swift
//  ParseChat
//
//  Created by Kenan Dominic on 2/23/17.
//  Copyright © 2017 Kenan Dominic. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func signUp() {
        var user = PFUser()
        
        user.password = passwordTextField.text
        user.username = emailTextField.text
        
        user.signUpInBackground { (result, error) in
            
            if let error = error {
                
                let errorMessage: String!
                errorMessage = error.localizedDescription
                print(error.localizedDescription)
                
                // Show the errorString somewhere and let the user try again.
                
                if (self.emailTextField.text?.isEmpty)! {
                    
                    let alertController = UIAlertController(title: "Email Required", message: errorMessage, preferredStyle: .alert)
                    
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        // handle response here.
                    }
                    // add the OK action to the alert controller
                    alertController.addAction(OKAction)
                    
                    self.present(alertController, animated: true) {
                    }
                }
                
                else if (self.passwordTextField.text?.isEmpty)! {
                    
                    let alertController = UIAlertController(title: "Password Required", message: errorMessage, preferredStyle: .alert)
                    
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        // handle response here.
                    }
                    // add the OK action to the alert controller
                    alertController.addAction(OKAction)
                    
                    self.present(alertController, animated: true) {
                    }
                }
                
                else {
                    
                    let alertController = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
                    
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        // handle response here.
                    }
                    // add the OK action to the alert controller
                    alertController.addAction(OKAction)
                    
                    self.present(alertController, animated: true) {
                    }
                }
            }
            
            else {
                let alertController = UIAlertController(title: "Sign Up Successful", message: "You can now log in", preferredStyle: .alert)
                
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    // handle response here.
                }
                // add the OK action to the alert controller
                alertController.addAction(OKAction)
                
                self.present(alertController, animated: true) {
                }
            }
        }
    }

    func logIn() {
        
        var user = PFUser()
        
        user.password = passwordTextField.text
        user.username = emailTextField.text
        
        PFUser.logInWithUsername(inBackground: user.username!, password: user.password!) { (success: PFUser?, error: Error?) in
            
            if let error = error {
                
                let errorMessage: String!
                errorMessage = error.localizedDescription
                print(error.localizedDescription)
                
                // Show the errorString somewhere and let the user try again.
                
                if (self.emailTextField.text?.isEmpty)! {
                    
                    let alertController = UIAlertController(title: "Username Required", message: errorMessage, preferredStyle: .alert)
                    
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        // handle response here.
                    }
                    // add the OK action to the alert controller
                    alertController.addAction(OKAction)
                    
                    self.present(alertController, animated: true) {
                    }
                }
                    
                else if (self.passwordTextField.text?.isEmpty)! {
                    
                    let alertController = UIAlertController(title: "Password Required", message: errorMessage, preferredStyle: .alert)
                    
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        // handle response here.
                    }
                    // add the OK action to the alert controller
                    alertController.addAction(OKAction)
                    
                    self.present(alertController, animated: true) {
                    }
                }
                
                else {
                    
                    let alertController = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
                    
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        // handle response here.
                    }
                    // add the OK action to the alert controller
                    alertController.addAction(OKAction)
                    
                    self.present(alertController, animated: true) {
                    }
                }
            }
                
            else {
                
                let alertController = UIAlertController(title: "Login Successful", message: "", preferredStyle: .alert)
                
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    // handle response here.
                    
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                }
                // add the OK action to the alert controller
                alertController.addAction(OKAction)
                
                self.present(alertController, animated: true) {
                }
            }
        }
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        
        signUp()
    }
    
    @IBAction func logInAction(_ sender: Any) {
        
        logIn()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
