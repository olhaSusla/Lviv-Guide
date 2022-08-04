//
//  ViewController.swift
//  Lviv Guide
//
//  Created by Ольга on 21.07.2022.
//
/*
 * Copyright 2020 Google Inc. All rights reserved.
 *
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this
 * file except in compliance with the License. You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software distributed under
 * the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
 * ANY KIND, either express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

import UIKit
import GoogleMaps
import CoreLocation
import Foundation

class MainViewController: UIViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    
    @IBOutlet weak var header: UILabel!
    
    @IBOutlet weak var stopRouteButtonLabel: UIButton!
    
    @IBOutlet weak var removeVisitedLocation: UIButton!
    @IBOutlet weak var topConstraine: NSLayoutConstraint!
    
    var locationManager = CLLocationManager()
    
    var isFirstLocationUpdate = true
    var isRouteMode = false
    
    var places = [Place]()
    var selectedPlace: Place?
    var routePlaces = [Place]()
    
    var routes = [Route]()
    var selectedRoute: Route?

    var courentIndex = -1
    
    var location: CLLocation?
    
    var polylines = [GMSPolyline]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRouteButtonLabel.layer.borderWidth = 1
        stopRouteButtonLabel.layer.borderColor = UIColor.systemGray3.cgColor
        
        removeVisitedLocation.layer.borderWidth = 1
        removeVisitedLocation.layer.borderColor = UIColor.systemGray3.cgColor
        
        places = AppLocationManager.shared.places
        routes = AppLocationManager.shared.routes
        
        for place in places {
            let positionMarker = CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude)
            let marker = GMSMarker(position: positionMarker)
            marker.title = place.name
            marker.map = mapView
            marker.icon = GMSMarker.markerImage(with: .green)
            mapView.selectedMarker = marker
        }
        
        let camera = GMSCameraPosition.camera(withLatitude: 49.8394561, longitude: 24.0325378, zoom: 6.0)
        
        //Your map setup code
        mapView.camera = camera
       
        self.mapView.isMyLocationEnabled = true
        
        //Location Manager code to fetch current location
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
    }
    
    @IBAction func placesList(_ sender: Any) {
        performSegue(withIdentifier: "placesList", sender: nil)
    }
    
    @IBAction func clearAll(_ sender: Any) {
        stopRoute()
    }
    
    @IBAction func removeVisitedLocation(_ sender: Any) {
        
        if routePlaces.count > 0 {
            if routePlaces.count == 1 {
                stopRoute()
            } else {
                routePlaces.remove(at: routePlaces.count - 1)
                polylines[polylines.count - 1].map = nil
                polylines.remove(at: polylines.count - 1)
                header.textColor = polylines[polylines.count - 1].strokeColor
            }
        }
    }
    
    func stopRoute() {
        for polyline in polylines {
            polyline.map = nil
        }
        
        polylines = [GMSPolyline]()
        
        courentIndex = -1
        isRouteMode = false
        
        routePlaces = [Place]()
        
        topConstraine.constant = -50
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
        
        header.textColor = .black
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {// #2 transfer information betwen VC
        if let infoWindowVC = segue.destination as? InfoWindowViewController {
            infoWindowVC.place = selectedPlace
        }
        if let placesListVC = segue.destination as? ListOfPlacesViewController {
            placesListVC.listOfPlaces = places
        }
        if let routesListVC = segue.destination as? ListOfRoutesViewController {
            routesListVC.routesList = routes
            routesListVC.completion = { route in
                
                self.topConstraine.constant = 0
                
                UIView.animate(withDuration: 0.5) {
                    self.view.layoutIfNeeded()
                }
                
                self.routePlaces = [Place]()
                self.isRouteMode = true
                
                self.courentIndex = route.places.count - 1
                
                for polyline in self.polylines {
                    polyline.map = nil
                }
                
                for place in route.places {
                    self.routePlaces.append(place)
                }
                
                self.polylines = [GMSPolyline]()
                
                self.fetchRoute(from: CLLocationCoordinate2D(latitude: route.places[self.courentIndex - 1].latitude, longitude: route.places[self.courentIndex - 1].longitude), to: CLLocationCoordinate2D(latitude: route.places[self.courentIndex].latitude, longitude: route.places[self.courentIndex].longitude))
                self.courentIndex = self.courentIndex - 1
                
                self.selectedRoute = route
            }
        }
    }
    
    func fetchRoute(from source: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D) {
        let session = URLSession.shared
        let url = URL(string: "https://maps.googleapis.com/maps/api/directions/json?origin=\(source.latitude),\(source.longitude)&destination=\(destination.latitude),\(destination.longitude)&key=\(directionGoogleAPIAPIkey)&mode=walking")!

        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in

            guard error == nil else {
                print(error!.localizedDescription)
                return
            }

            guard let jsonResult = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any] else {
                print("error in JSONSerialization")
                return
            }

            guard let routes = jsonResult["routes"] as? [Any] else {
                return
            }

            guard let route = routes[0] as? [String: Any] else {
                return
            }

            guard let overview_polyline = route["overview_polyline"] as? [String: Any] else {
                return
            }

            guard let polyLineString = overview_polyline["points"] as? String else {
                return
            }

            //Call this method to draw path on map
            self.drawPath(from: polyLineString)
        })
        task.resume()
    }

    var colors: [UIColor] = [.systemIndigo, .systemPurple, .brown, .red, .blue, .darkGray, .systemPink, .purple]; //TODO: colors
    
    func drawPath(from polyStr: String){
        let path = GMSPath(fromEncodedPath: polyStr)
        let polyline = GMSPolyline(path: path)
        polyline.strokeWidth = 6.0
        polyline.strokeColor = colors[(courentIndex + 1) % 8]
        polyline.map = mapView
        
        
        
        polylines.append(polyline)
        
        if courentIndex == 0 {
            guard let selectedRoute = selectedRoute, let location = location else {
                return
            }
            
            let startCordinate = CLLocationCoordinate2D(latitude: selectedRoute.places[courentIndex].latitude, longitude: selectedRoute.places[courentIndex].longitude)
            let endCordinate = location.coordinate
            
            self.fetchRoute(from: startCordinate, to: endCordinate)
            
            courentIndex = -1
        }
        else if courentIndex > 0 {
            
            guard let selectedRoute = selectedRoute else {
                return
            }
            
            let startCordinate = CLLocationCoordinate2D(latitude: selectedRoute.places[courentIndex].latitude, longitude: selectedRoute.places[courentIndex].longitude)
            let endCordinate = CLLocationCoordinate2D(latitude: selectedRoute.places[courentIndex - 1].latitude, longitude: selectedRoute.places[courentIndex - 1].longitude)
            
            self.fetchRoute(from: startCordinate, to: endCordinate)
            
            courentIndex = courentIndex - 1
        } else {
            DispatchQueue.main.async {
                self.header.textColor = self.colors[(self.courentIndex + 1) % 8]
            }
        }
    }
}

extension MainViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        print("tapped on marker")
        
        for place in places {
            if marker.title == place.name { //marker.userData.getID
                selectedPlace = place
            }
        }
        performSegue(withIdentifier: "placeInfo", sender: nil) // #1 виклик сегуї(звязку між контролерами) який виконає перехід
        return true
    }
}

extension MainViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        location = locations.last

        if isFirstLocationUpdate {
            let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 17.0)
            
            mapView.camera = camera
            mapView.delegate = self
            
            isFirstLocationUpdate = false
        }
        
        var headerText = ""
        
        if isRouteMode {
            let neresDistanceInMeters = (location?.distance(from: CLLocation(latitude: routePlaces[0].latitude, longitude: routePlaces[0].longitude)) ?? 0)
            
            if neresDistanceInMeters < 1000 {
                headerText =  "The next point is \(routePlaces[0].name) \(Int(neresDistanceInMeters)) metters away"
            } else {
                let roundedDistance = round((neresDistanceInMeters / 1000) * 10) / 10.0
                headerText =  "The next point is \(routePlaces[0].name) \(roundedDistance) kilometrs away"
            }
        } else {
            var nerestIndex = 0
            var neresDistanceInMeters = (location?.distance(from: CLLocation(latitude: places[0].latitude, longitude: places[0].longitude)) ?? 0)
            
            for i in 0..<places.count {
                let distanceInMeters = (location?.distance(from: CLLocation(latitude: places[i].latitude, longitude: places[i].longitude)) ?? 0)
                
                if distanceInMeters < neresDistanceInMeters {
                    nerestIndex = i
                    neresDistanceInMeters = distanceInMeters
                }
            }
    
            if neresDistanceInMeters < 1000 {
                headerText =  "The closest is \(places[nerestIndex].name) \(Int(neresDistanceInMeters)) metters away"
            } else {
                let roundedDistance = round((neresDistanceInMeters / 1000) * 10) / 10.0
                headerText =  "The closest is \(places[nerestIndex].name) \(roundedDistance) kilometrs away"
            }
        }
        
        
        
        header.text = headerText
        
    }
}


