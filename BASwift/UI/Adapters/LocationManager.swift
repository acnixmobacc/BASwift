//
//  LocationManager.swift
//  LocationManager
//
//  Created by Burak Akkaya on 21/06/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import MapKit
import UIKit

public protocol LocationManagerDelegate: class {
    func onUserLocationUpdate(_ location: CLLocationCoordinate2D)
}

open class LocationManager<T: BaseViewModelProtocol> : NSObject, CLLocationManagerDelegate, MKMapViewDelegate {

    weak var delegate: LocationManagerDelegate?

    private var locationManager: CLLocationManager = CLLocationManager()
    private var _userLocationUpdateEnabled: Bool!

    var leftPadding: CGFloat = 30.0
    var rightPadding: CGFloat = 30.0
    var topPadding: CGFloat = 30.0
    var bottomPadding: CGFloat = 30.0

    var locationVM: T
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

    public var isUserLocationUpdateEnabled: Bool {
        set(value) {
            _userLocationUpdateEnabled = value
            value == true ? locationManager.startUpdatingLocation() : locationManager.stopUpdatingLocation()
        }

        get {
            return _userLocationUpdateEnabled
        }
    }

    public var userLocation: CLLocationCoordinate2D! {
        didSet {
            delegate?.onUserLocationUpdate(userLocation)
            didUpdateUserLocation()
        }
    }

    public init(_ viewModel: T, mapView: MKMapView) {
        self.locationVM = viewModel
        self.mapView = mapView
        super.init()
        self.mapView.delegate = self
        setLocationManagerProperty()
    }

    private func setLocationManagerProperty() {
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        isUserLocationUpdateEnabled = true

    }

    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        userLocation = (manager.location?.coordinate)!

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

        let pinIdent = "Pin"
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

        mapView.setVisibleMapRect(zoomRect,
                                  edgePadding: UIEdgeInsets(top: topPadding, left: leftPadding,
                                                            bottom: bottomPadding, right: rightPadding),
                                  animated: true)
    }

}
