//
//  ProfileViewController.swift
//  iosauthdemo
//
//  Created by Bheki Maenetja on 2020/07/01.
//  Copyright © 2020 Bonanza. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var ProfileImage: UIImageView!
    @IBOutlet weak var TxtName: UITextField!
    @IBOutlet weak var TxtCity: UITextField!
    @IBOutlet weak var TxtWeb: UITextField!
    @IBOutlet weak var TxtBio: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SaveTouch(_ sender: Any) {
    }
    
    @IBAction func LogoutTouch(_ sender: Any) {
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
