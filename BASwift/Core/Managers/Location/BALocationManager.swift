//
//  LocationManager.swift
//  LocationManager
//
//  Created by Burak Akkaya on 21/06/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import MapKit
import UIKit

public protocol BALocationManagerDelegate: class {
    func onUserLocationUpdate(_ location: CLLocationCoordinate2D)
}

open class BALocationManager: NSObject, CLLocationManagerDelegate, MKMapViewDelegate {

    // MARK: - Static Variables
    fileprivate static let annotationID = "Pin"

    // MARK: - Properties
    public weak var delegate: BALocationManagerDelegate?

    private var locationManager: CLLocationManager = CLLocationManager()

    private var _updateUserLocation: Bool!

    var leftPadding: CGFloat = 30.0

    var rightPadding: CGFloat = 30.0

    var topPadding: CGFloat = 30.0

    var bottomPadding: CGFloat = 30.0

    var mapView: MKMapView

    public var permissionStatus: CLAuthorizationStatus {
        return CLLocationManager.authorizationStatus()
    }

    public var isEnabledUserLocation: Bool {
        switch permissionStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            return true
        default:
            return false
        }
    }

    public var updateUserLocation: Bool {
        set(value) {
            _updateUserLocation = value
            value == true ? locationManager.startUpdatingLocation() : locationManager.stopUpdatingLocation()
        }

        get {
            return _updateUserLocation
        }
    }

    public var userLocation: CLLocationCoordinate2D? {
        didSet {
            if let userLocation = userLocation {
                delegate?.onUserLocationUpdate(userLocation)
                didUpdateUserLocation()
            }
        }
    }

    // MARK: - Initialization
    public init(withMapView mapView: MKMapView) {
        self.mapView = mapView
        super.init()
        self.setMapView()
    }

    // MARK: - Methods
    public func setMapView() {
        self.mapView.delegate = self
        setVisiblePadding()
        setLocationManagerProperty()
    }

    public func setVisiblePadding(top: CGFloat = 30.0, left: CGFloat = 30.0,
                                  bottom: CGFloat = 30.0, right: CGFloat = 30.0) {
        self.topPadding = top
        self.leftPadding = left
        self.bottomPadding = bottom
        self.rightPadding = right
    }

    public func requestAlwaysAuthorization() {
        locationManager.requestAlwaysAuthorization()
    }

    public func requestWhenInUseAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }

    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        userLocation = (manager.location?.coordinate)!
    }

    public func zoomUserLocation() {
        if let userLocation = self.userLocation {
            let center = CLLocationCoordinate2D(latitude: userLocation.latitude, longitude: userLocation.longitude)
            var region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
            region.center = mapView.userLocation.coordinate
            mapView.setRegion(region, animated: true)
        }
    }

    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {

    }

    public func didUpdateUserLocation() {}

    public func resetMapPins() {
        for annotation in mapView.annotations {
            mapView.removeAnnotation(annotation)
        }
    }

    public func addAnnotation(coordinates: [CLLocation]) {
        for coord in coordinates {
            let clcoord = CLLocationCoordinate2D(latitude: coord.coordinate.latitude,
                                                 longitude: coord.coordinate.longitude)

            let annotation = MKPointAnnotation()
            annotation.coordinate = clcoord
            mapView.addAnnotation(annotation)
        }
        showPins(mapView.annotations)
    }

    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

        if annotation is MKUserLocation {
            return nil
        }

        let pinIdent = BALocationManager.annotationID

        var pinView: MKPinAnnotationView

        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: pinIdent) as? MKPinAnnotationView {
            dequeuedView.annotation = annotation
            pinView = dequeuedView
        } else {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: pinIdent)

        }
        return pinView
    }

    public func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {

    }

    public func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {

    }

    public func showPins(_ annotations: [MKAnnotation]) {
        var zoomRect: MKMapRect = MKMapRectNull

        for annotation in annotations {
            let point = MKMapPointForCoordinate(annotation.coordinate)
            let pointRect = MKMapRectMake(point.x, point.y, 0, 0)
            if MKMapRectIsNull(zoomRect) {
                zoomRect = pointRect
            } else {
                zoomRect = MKMapRectUnion(zoomRect, pointRect)
            }
        }

        setVisibility(zoomRect)
    }

    // MARK: - Private Methods
    private func setLocationManagerProperty() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

    private func setVisibility(_ zoomRect: MKMapRect) {
        mapView.setVisibleMapRect(zoomRect,
                                  edgePadding: UIEdgeInsets(top: topPadding, left: leftPadding,
                                                            bottom: bottomPadding, right: rightPadding),
                                  animated: true)
    }

}
