//
//  MapViewController.swift
//  MapProject
//
//  Created by Fatemeh Ghanavati  on 02/02/2022.
//

import UIKit
import MapKit



class MapViewController: UIViewController {
    
    @IBOutlet weak var sharebutton: UIButton!
    @IBOutlet weak var mapView: MKMapView!
  
    
    
    var locationViewModel: LocationViewModel!
    var locationArray: [Results] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        // Do any additional setup after loading the view.
    }
    
    private func initView() {
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 52.500342, longitude: 13.425170), span: span)
        mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 52.500342, longitude: 13.425170)
        mapView.addAnnotation(annotation)
        locationViewModel = LocationViewModel()
        sharebutton.backgroundColor = UIColor.white
        sharebutton.layer.cornerRadius = 25
        sharebutton.setTitleShadowColor(.black, for: .normal)
        getLocation()
    }
    
    @IBAction func shareButton(_ sender: Any) {
        guard let data = URL(string: "https://www.google.com/") else { return }
        let av = UIActivityViewController(activityItems: [data], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
    }
    
    
    private func getLocation() {
        locationViewModel.getLocation{response, error in
            if error == nil {
                if let response = response, let results = response.results {
                    results.forEach { place in
                        if let geocode = place.geocodes, let main = geocode.main {
                            guard let lat = main.latitude, let long = main.longitude else { return }
                            let annotation = MKPointAnnotation()
                            annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
                            self.mapView.addAnnotation(annotation)
                        }
                    }
                }
            } else {
                print(ErrorModel(title: "Error", message: "Error"))
            }
        }
        
    }
}

