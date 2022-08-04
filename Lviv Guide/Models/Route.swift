//
//  Route.swift
//  Lviv Guide
//
//  Created by Ольга on 01.08.2022.
//

import Foundation
 
class Route {
    var places: [Place]
    var name: String?
    var imageName: String?
    var discription: String?
    
    init(places: [Place], name: String, imageName: String?,discription: String? ) {
        self.places = places
        self.name = name
        self.discription = discription
        self.imageName = imageName
    }
}
