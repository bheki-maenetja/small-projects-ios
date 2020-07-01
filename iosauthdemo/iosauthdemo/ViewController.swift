//
//  ViewController.swift
//  iosauthdemo
//
//  Created by Bheki Maenetja on 2020/07/01.
//  Copyright © 2020 Bonanza. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var TxtUsername: UITextField!
    @IBOutlet weak var TxtPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func alertSomething(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }

    @IBAction func LoginTouch(_ sender: Any) {
        Auth.auth().signIn(withEmail: TxtUsername.text!, password: TxtPassword.text!) {
            (user, error) in
            if error  != nil {
                self.alertSomething(title: "Login Error", message: "You have failed to log in")
            } else {
                self.performSegue(withIdentifier: "goProfile", sender: self)
            }
        }
    }
    
    @IBAction func RegisterTouch(_ sender: Any) {
        Auth.auth().createUser(withEmail: TxtUsername.text!, password: TxtPassword.text!) {
            (user, error) in
            if error != nil {
                self.alertSomething(title: "Account Error", message: "There was a problem creating your account")
            } else {
                self.alertSomething(title: "Account Created", message: "You account was successfully created!")
            }
        }
    }
    
}

