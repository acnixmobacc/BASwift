//
//  LocationViewController.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 27.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift
import MapKit

class LocationViewController: BaseViewController<LocationViewModel> {

    @IBOutlet weak private var mapView: MKMapView!

    fileprivate var pendik: CLLocation = CLLocation(latitude: 40.8796, longitude: 29.2580)
    fileprivate var besiktas: CLLocation = CLLocation(latitude: 41.0441, longitude: 29.0017)
    fileprivate var maltepe: CLLocation = CLLocation(latitude: 40.9339, longitude: 29.1650)
    fileprivate var trabzon: CLLocation = CLLocation(latitude: 41.0, longitude: 39.733_330_4)

    weak var coordinatorDelegate: DashboardCoordinatorDelegate?

    lazy var locationManager: LocationManager = {
        return LocationManager(withMapView: mapView)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.requestAlwaysAuthorization()
        locationManager.updateUserLocation = true
        //locationManager.delegate = self
        addPins()
    }

    private func addPins() {
        locationManager.addAnnotation(coordinates: [trabzon, pendik, besiktas, maltepe])
    }
}

extension LocationViewController: LocationManagerDelegate {

    func onUserLocationUpdate(_ location: CLLocationCoordinate2D) {
        locationManager.zoomUserLocation()
    }

}
