//
//  ViewController.swift
//  map tests
//
//  Created by Christian Croona on 24/03/16.
//  Copyright © 2016 christian. All rights reserved.
//

import MapKit
import CoreLocation
import UIKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    let locationMgr = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationMgr.delegate = self
        locationMgr.requestWhenInUseAuthorization()
        locationMgr.desiredAccuracy = kCLLocationAccuracyBest
        locationMgr.startUpdatingLocation()
        
        mapView.delegate = self
        mapView.mapType = MKMapType.Standard
        mapView.showsUserLocation = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //For updating location after initial load
    @IBAction func getLocation(sender: UIButton) {
        locationMgr.requestWhenInUseAuthorization()
        locationMgr.desiredAccuracy = kCLLocationAccuracyBest
        locationMgr.startUpdatingLocation()
        
        mapView.delegate = self
        mapView.mapType = MKMapType.Standard
        mapView.showsUserLocation = true
    }
    
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last
        let center = CLLocationCoordinate2DMake(location!.coordinate.latitude, location!.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        let region = MKCoordinateRegion(center: center, span: span)
        //print(center)
        let location1 = CLLocationCoordinate2DMake(59.314464, 18.068999)
        let location2 = CLLocationCoordinate2DMake(59.319197, 18.05355)
        let location3 = CLLocationCoordinate2DMake(59.317993, 18.04754)
        
        //Defines
        let annotation = MKPointAnnotation()
        annotation.coordinate = location1
        annotation.title = "Söder test 1"
        annotation.subtitle = ""
        
       let annotation2 = MKPointAnnotation()
        annotation2.coordinate = location2
        annotation2.title = "Söder test 2"
        annotation2.subtitle = ""
        
        
        let annotation3 = MKPointAnnotation()
        annotation3.coordinate = location3
        annotation3.title = "Söder test 3"
        annotation3.subtitle = ""

        //Calls the built-in functions addAnnotation, setRegion and stopUpdating
        mapView.addAnnotation(annotation)
        mapView.addAnnotation(annotation2)
        mapView.addAnnotation(annotation3)
        mapView.setRegion(region, animated: true)
        locationMgr.stopUpdatingLocation()
    }
    
    //Simple 2-step zoom in and out function
    @IBAction func zoomIn(sender: UIButton) {
        let userLocation = mapView.userLocation
        
        let region = MKCoordinateRegionMakeWithDistance(userLocation.location!.coordinate, 1000, 1000)
        
        mapView.setRegion(region, animated: true)
    }
    
    @IBAction func zoomOut(sender: UIButton) {
        let userLocation = mapView.userLocation
        
        let region = MKCoordinateRegionMakeWithDistance(userLocation.location!.coordinate, 2000, 2000)
        
        mapView.setRegion(region, animated: true)
        
    }
    
}
