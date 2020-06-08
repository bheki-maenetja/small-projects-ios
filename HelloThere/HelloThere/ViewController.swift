//
//  ViewController.swift
//  HelloThere
//
//  Created by Bheki Maenetja on 2020/06/04.
//  Copyright © 2020 Bonanza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var LblMessage: UILabel!
    @IBOutlet weak var TxtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pushButton(_ sender: UIButton) {
        let userName: String = TxtName.text ?? "Unknown"
        LblMessage.text = "Hello " + userName
    }
    

}

