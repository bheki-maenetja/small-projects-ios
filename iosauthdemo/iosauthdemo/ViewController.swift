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

    @IBAction func LoginTouch(_ sender: Any) {
    }
    
    @IBAction func RegisterTouch(_ sender: Any) {
        Auth.auth().createUser(withEmail: TxtUsername.text!, password: TxtPassword.text!) {
            (user, error) in
            if error != nil {
                let alertController = UIAlertController(title: "Account Error", message: "There was a problem creating your account", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            } else {
                let alertController = UIAlertController(title: "Account Created", message: "Your account was successfully created", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
}

