//
//  MapViewController.swift
//  SwiftApp
//
//  Created by Juan Ramon Rodriguez Rosado on 20/10/2019.
//  Copyright © 2019 jrrodriguez. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    var mapView: MKMapView?
    var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView = MKMapView(frame: view.frame)
        mapView?.delegate = self
        mapView?.showsUserLocation = true
        view.addSubview(mapView!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationManager = CLLocationManager()
        locationManager?.requestWhenInUseAuthorization()
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let region = MKCoordinateRegion.init(center: userLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation.isKind(of: MKUserLocation.classForCoder()) {
            return nil
        }
        
        let pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "PinVioleta")
        pin.pinTintColor = UIColor.purple
        
        return pin
    }
    
    @IBAction func addPinToMap(_ sender: UIBarButtonItem) {
        let pin = MKPointAnnotation()
        pin.coordinate = mapView!.userLocation.coordinate
        pin.title = "hola"
        mapView?.addAnnotation(pin)
    }
}
