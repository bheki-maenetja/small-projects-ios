//
//  ViewController.swift
//  WebSearch
//
//  Created by Bheki Maenetja on 2020/06/09.
//  Copyright © 2020 Bonanza. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var TxtAddress: UITextField!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let startURL = URL(string: "https://www.apple.com/")!
        webView.load(URLRequest(url: startURL))
        // Do any additional setup after loading the view.
    }

    @IBAction func WebNavigate(_ sender: Any) {
        let address: String = TxtAddress.text!
        
        if address == "" {
            let alertController = UIAlertController(title: "Invalid Entry", message: "Please enter a valid url", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            return
        } else {
            let userURL = URL(string: address)!
            webView.load(URLRequest(url: userURL))
        }
        
        for textField in self.view.subviews where textField is UITextField {
            textField.resignFirstResponder()
        }
    }
    
}

