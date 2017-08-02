//
//  FooyoBaseMapViewController.swift
//  CarthageTest
//
//  Created by Yangfan Liu on 2/8/17.
//  Copyright © 2017 Yangfan Liu. All rights reserved.
//

import UIKit
import Mapbox

public class FooyoBaseMapViewController: BaseViewController {

    var mapView: MGLMapView!
    var mapCenter: CLLocationCoordinate2D?
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mapView = MGLMapView(frame: view.bounds)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(mapView)

        
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
