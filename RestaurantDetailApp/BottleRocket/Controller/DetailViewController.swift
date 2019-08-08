//
//  DetailViewController.swift
//  BottleRocket
//
//  Created by Priyanka Chaturvedi on 8/1/19.
//  Copyright © 2019 Priyanka Chaturvedi. All rights reserved.
//

import UIKit
import MapKit
class customPin: NSObject,MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    init(pinTitle:String, location: CLLocationCoordinate2D) {
        self.title = pinTitle
       
        self.coordinate = location
    }
}
class DetailViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var restaurantNameLbl: UILabel!
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var contactLbl: UILabel!
    @IBOutlet weak var twitterLbl: UILabel!
    
    
    var getRestaurantName = String()
    var getCategory = String()
    var getAddress = String()
    var getContact = String()
    var getTwitter = String()
    var getLatitude = Double()
    var getLongitute = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restaurantNameLbl.text = getRestaurantName
        categoryLbl.text = getCategory
        addressLbl.text = getAddress
        contactLbl.text = getContact
        twitterLbl.text = getTwitter
        
        let location = CLLocationCoordinate2DMake(getLatitude,getLongitute )
        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        self.mapView.setRegion(region, animated: true)
        let pin = customPin(pinTitle: getRestaurantName, location: location)
        self.mapView.addAnnotation(pin)
    }
}
