//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Ata Bahar on 3/9/19.
//  Copyright © 2019 atabahar. All rights reserved.
//

import UIKit

import Parse

class LoginViewController: UIViewController
{

    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        setupTitle()
    }
    
    func setupTitle()
    {
        // With this NS we are opening a library of text editing tools,
        //  Then we assign it with (.attributedText)
        let attributedTitleText = NSMutableAttributedString()
        
        attributedTitleText.append(NSAttributedString(string: "Build your profile", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20), NSAttributedString.Key.foregroundColor : UIColor(red:1.00, green:0.54, blue:0.17, alpha:1.0)  ]))
        
        //
        
        titleLabel.attributedText = attributedTitleText
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil
            {
               self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else
            {
                print("Error: \(error?.localizedDescription)")
        
    }
        }
    }
    
    @IBAction func onSignup(_ sender: Any) {
        
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                
            }
            else {
                print("Error: \(error?.localizedDescription)")
            }
            
            
        }
        
     }

}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



