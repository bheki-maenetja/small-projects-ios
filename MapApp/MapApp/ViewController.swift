//
//  ViewController.swift
//  MapApp
//
//  Created by Bheki Maenetja on 2020/06/26.
//  Copyright © 2020 Bonanza. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var areaLabel: UILabel!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue: CLLocationCoordinate2D = manager.location!.coordinate
        print("location: \(locValue.latitude) \(locValue.longitude)")
        let userLoc = locations.last
        let viewRegion = MKCoordinateRegion(center: (userLoc!.coordinate), latitudinalMeters: 600, longitudinalMeters: 600)
        
        geocode(latitude: locValue.latitude, longitude: locValue.longitude)
        {
            placemark, error in
            guard let placemark = placemark, error == nil else {
                return
            }
            DispatchQueue.main.async {
                let address1 = placemark.thoroughfare ?? "-"
                let city = placemark.locality ?? "-"
                let state = placemark.administrativeArea ?? "-"
                let zipcode = placemark.postalCode ?? "-"
                let country = placemark.country ?? "-"
                self.areaLabel.text = "\(address1), \(city), \(state), \(zipcode), \(country)"
            }
        }
        
        self.mapView.showsUserLocation = true
        self.mapView.setRegion(viewRegion, animated: true)
    }
    
    func geocode(latitude: Double, longitude: Double, completion: @escaping (CLPlacemark?, Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: latitude, longitude: longitude))
        {
            completion($0?.first, $1)
        }
    }
}

