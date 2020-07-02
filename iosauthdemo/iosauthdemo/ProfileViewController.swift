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
        var ref: DatabaseReference!
        ref = Database.database().reference()
        let userId = Auth.auth().currentUser?.uid
        
        ref.child("users").child(userId!).observeSingleEvent(of: .value, with: {
            (snapshot) in
            let value = snapshot.value as? NSDictionary
            self.TxtName.text = value?["name"] as? String ?? ""
            self.TxtCity.text = value?["city"] as? String ?? ""
            self.TxtWeb.text = value?["web"] as? String ?? ""
            self.TxtBio.text = value?["bio"] as? String ?? ""
            
            let imgRef = Storage.storage().reference().child("img/" + userId! + ".jpg")
            imgRef.getData(maxSize: 1 * 1024 * 1024) {
                data, error in
                if let error = error {
                } else {
                    let image = UIImage(data: data!)
                    self.ProfileImage.image = image
                }
            }
        }) { (error) in
            print(error.localizedDescription)
        }
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
            ref = Database.database().reference()
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
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided with \(info)")
        }
        ProfileImage.image = image
        dismiss(animated: true, completion: nil)
        imageUpload()
    }
    
    func imageUpload() {
        let userId = Auth.auth().currentUser?.uid
        let imageData = ProfileImage.image!.jpegData(compressionQuality: 0.4)
        let storageRef = Storage.storage().reference().child("img/" + userId! + ".jpg")
        
        if let uploadData = imageData {
            storageRef.putData(uploadData, metadata: nil) {
                (metadata, error) in
                if error != nil {
                    self.alertSomething(title: "Profile Photo", message: "There was an error uploading your photo")
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

}
