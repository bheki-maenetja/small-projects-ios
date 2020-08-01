//
//  ViewController.swift
//  ApplePie
//
//  Created by Bheki Maenetja on 2020/08/01.
//  Copyright © 2020 Bonanza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var treeImage: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isEnabled = false
    }
    

}

