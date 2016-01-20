//
//  ViewController.swift
//  WhereAmI
//
//  Created by Rebecca Kilberg on 1/19/16.
//  Copyright © 2016 Rebecca Works. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!

    @IBOutlet weak var alt: UILabel!
    
    @IBOutlet weak var long: UILabel!
    
    @IBOutlet weak var lat: UILabel!
    
    @IBOutlet weak var course: UILabel!
    
    @IBOutlet weak var speed: UILabel!
    
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        alt.text = "Your altitude is: " + String(locations[0].altitude)
        long.text = "Your longitude is: " + String(locations[0].coordinate.longitude)
        lat.text = "Your latitude is: " + String(locations[0].coordinate.latitude)
        course.text = "Your course is: " + String(locations[0].course)
        speed.text = "Your speed is: " + String(locations[0].speed)
        
        let userLocation: CLLocation = locations[0]
        
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        
        let latDelta: CLLocationDegrees = 0.05
        let longDelta: CLLocationDegrees = 0.05
        
        let span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        self.map.setRegion(region, animated: false)
        
    }

}

