//
//  NewUserViewController.swift
//  IesbSocialUikit
//
//  Created by Wesley Marra on 23/10/21.
//

import UIKit
import CoreLocation
import Contacts

class NewUserViewController: UITableViewController {

    
    @IBOutlet weak var postalCode: UITextField!
    @IBOutlet weak var street: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var city: UITextField!
    
    private var receivedLocation: CLLocationCoordinate2D?
    private let geocoder = CLGeocoder()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let location = receivedLocation {
            
            geocoder.reverseGeocodeLocation(
                CLLocation(latitude: location.latitude,
                           longitude: location.longitude)) {
                               
                placemarks, erro in
                if let placemark = placemarks?.last, let address = placemark.postalAddress {
                    
                    self.postalCode.text = address.postalCode
                    self.street.text = address.street
                    self.state.text = address.state
                    self.city.text = address.city
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMapSegue" {
            if let destination = segue.destination as? MapViewController {
                destination.delegate = self
            }
        }
    }
}

extension NewUserViewController: MapViewControllerDelegate {
    func userDidChooseLocation(_ location: CLLocationCoordinate2D) {
        receivedLocation = location
    }
}
