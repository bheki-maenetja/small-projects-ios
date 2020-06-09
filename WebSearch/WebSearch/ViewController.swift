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
    }
    
}

