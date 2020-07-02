//
//  ProfileViewController.swift
//  iosauthdemo
//
//  Created by Bheki Maenetja on 2020/07/01.
//  Copyright © 2020 Bonanza. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var ProfileImage: UIImageView!
    @IBOutlet weak var TxtName: UITextField!
    @IBOutlet weak var TxtCity: UITextField!
    @IBOutlet weak var TxtWeb: UITextField!
    @IBOutlet weak var TxtBio: UITextView!
    
    
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
    
    @IBAction func SaveTouch(_ sender: Any) {
        if TxtName.text == "" || TxtCity.text == "" || TxtWeb.text == "" || TxtBio.text == "" {
            alertSomething(title: "Entry Error", message: "Please enter values in all text boxes")
        } else {
            var ref: DatabaseReference!
            let userId = Auth.auth().currentUser?.uid
            ref.child("users/" + userId! + "/name").setValue(TxtName.text)
            ref.child("users/" + userId! + "/city").setValue(TxtCity.text)
            ref.child("users/" + userId! + "/web").setValue(TxtWeb.text)
            ref.child("users/" + userId! + "/bio").setValue(TxtBio.text)
            alertSomething(title: "Profile Updated", message: "Your profile has been successfully updated")
        }
    }
    
    @IBAction func LogoutTouch(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "goLogin", sender: self)
        } catch {
            alertSomething(title: "Logout Error", message: "Please try again")
        }
    }
    
    @IBAction func UpdatePhoto(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
