//
//  ViewController.swift
//  MapKit_byNewbie
//
//  Created by Andrey on 2.08.21.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialLocation = CLLocation(latitude: 59.929691, longitude: 30.362239)
        mapView.centerLocation(initialLocation)
        
        let cameraCenter = CLLocation(latitude: 59.929691, longitude: 30.362239)
        let region = MKCoordinateRegion(center: cameraCenter.coordinate, latitudinalMeters: 50000, longitudinalMeters: 50000)
        mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
        
        let zoomRage = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 100000)
        mapView.setCameraZoomRange(zoomRage, animated: true)
        
        let KC = Places(title: "Казанский Собор",
                        locationName: "Казанская пл.2",
                        discipline: "Cathedral",
                        coordinate: CLLocationCoordinate2D(latitude: 59.929691, longitude: 30.362239))
        
        mapView.addAnnotation(KC)
    }


}
extension MKMapView {
    func centerLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 1000) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}

