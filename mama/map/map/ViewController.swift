//
//  ViewController.swift
//  map
//
//  Created by Moeung Theara on 10/27/16.
//  Copyright © 2016 Moeung Theara. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController , MKMapViewDelegate {
    @IBOutlet weak var mapping: MKMapView!
    override func viewDidLoad() {
        self.mapping.delegate = self;
        super.viewDidLoad()
        let latitude:CLLocationDegrees  = 11.568790
        let longitude:CLLocationDegrees = 104.891587
        let longDelt:CLLocationDegrees = 0.5
        let lateDelt:CLLocationDegrees = 0.5
        let span:MKCoordinateSpan = MKCoordinateSpanMake(lateDelt, longDelt)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: longitude , longitude: latitude)
        let origin:MKCoordinateRegion = MKCoordinateRegion(center: location,span: span)
        
        mapping.setRegion(origin, animated: true)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

