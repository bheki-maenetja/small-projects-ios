//
//  ViewController.swift
//  WeatherApp
//
//  Created by Bheki Maenetja on 2020/07/13.
//  Copyright © 2020 Bonanza. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var LblTemp: UILabel!
    
    var locationManager = CLLocationManager()
    var lat: Double = 0.0
    var long: Double = 0.0
    var tempType = "metric"
    var stringTemp = "°C"
    
    let apiKey = "bf2194251d3a6575ba2959b20105a3eb"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func callAPI(_ sender: Any) {
    }
    
}

