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
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue: CLLocationCoordinate2D = manager.location!.coordinate
        
        lat = locValue.latitude
        long = locValue.longitude
    }

    @IBAction func callAPI(_ sender: Any) {
        let querytypeURL = "http://samples.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(long)&units=\(tempType)&appid=\(apiKey)"
        
        let session = URLSession.shared
        let weatherURL = URL(string: querytypeURL)
        let dataTask = session.dataTask(with: weatherURL!) {
            (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                print("Error:\n\(error)")
            } else {
                if let data = data {
                    let dataString = String(data: data, encoding: String.Encoding.utf8)
                    print("All the weather data:\n\(dataString!)")
                    
                    if let jsonObj = ((try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary) as NSDictionary??) {
                        if let mainDictionary = jsonObj?.value(forKey: "main") as? NSDictionary {
                            if let temperature = mainDictionary.value(forKey: "temp") {
                                DispatchQueue.main.sync {
                                    self.LblTemp.text = "Location temperature: \(temperature)" + self.stringTemp
                                }
                            }
                        } else {
                            print("Error: unable to find temperature")
                        }
                    } else {
                        print("Error: unable to convert json")
                    }
                } else {
                    print("Error: did not receive data")
                }
            }
        }
        dataTask.resume()
    }
    
}

