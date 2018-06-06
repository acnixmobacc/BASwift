//  Constant.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 30/10/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//
import Foundation

public enum Constant {
    enum Map {
        static let YandexMapsURL: String = "yandexnavi://"
        static let GoogleMapsURL: String = "comgooglemaps://"
        static let YandexDirectionFormat: String = "yandexnavi://build_route_on_map?lat_from=%f&lon_from=%f&lat_to=%f&lon_to=%f"
        static let GoogleMapsDirectionFormat: String = "comgooglemaps://?saddr=&daddr=%f,%f&directionsmode=driving"
        static let AppleMapsDirectionFormat: String = "http://maps.apple.com/maps?saddr=%f,%f&daddr=%f,%f"
    }
}
