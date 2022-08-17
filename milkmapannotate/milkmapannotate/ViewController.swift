//
//  ViewController.swift
//  milkmapannotate
//
//  Created by Scholar on 8/17/22.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate {

    let map = MKMapView()
    let coordinate = CLLocationCoordinate2D(latitude: 40.720, longitude: -74)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(map)
        map.frame = view.bounds
        
        map.setRegion(MKCoordinateRegion(center: coordinate,
                                         span: MKCoordinateSpan(latitudeDelta: 0.1,
                                                                longitudeDelta: 0.1
                            )
                    ),
                      animated: false)
        map.delegate = self
        
        addCustomPin()
    }

    private func addCustomPin() {
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        pin.title = "Milk Bank"
        pin.subtitle = "Donate your breast milk today!"
        map.addAnnotation(pin)
    }
    
    // Map
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        var annotationView = map.dequeueReusableAnnotationView(withIdentifier: "custom")
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
    
        annotationView?.image = UIImage(named: "bottle")
        
        
        return annotationView
    }
}


