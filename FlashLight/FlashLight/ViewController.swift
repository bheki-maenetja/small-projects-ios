//
//  ViewController.swift
//  FlashLight
//
//  Created by Bheki Maenetja on 2020/07/18.
//  Copyright © 2020 Bonanza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lightButton: UIButton!
    var isLightOn : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lightButton.setTitle("OFF", for: .normal)
        
    }

    @IBAction func toggleLight(_ sender: UIButton) {
        changeLight()
    }
    
    func changeLight() {
        isLightOn = !isLightOn
        if isLightOn {
            view.backgroundColor = .black
            lightButton.setTitle("ON", for: .normal)
        } else {
            view.backgroundColor = .white
            lightButton.setTitle("OFF", for: .normal)
        }
    }
}

