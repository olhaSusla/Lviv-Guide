//
//  Places.swift
//  Lviv Guide
//
//  Created by Ольга on 24.07.2022.
//

import Foundation


class Place {
    var name: String
    var latitude: Double
    var longitude: Double
    var info: String
    
    var imageName: String?
    var audioGuideName: String?
    var address: String?
    var url: String?
    
    init(name: String, latitude: Double, longitude: Double, info: String, imageName: String? = nil, audioGuideName: String? = nil, address: String? = nil, url: String? = nil) {
//    init(name: String, latitude: Double, longitude: Double, info: String){
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.imageName = imageName
        self.info = info
        self.audioGuideName = audioGuideName
        self.address = address
        self.url = url
    }
    
}
