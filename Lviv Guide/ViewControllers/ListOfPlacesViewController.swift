//
//  ListOfPlacesViewController.swift
//  Lviv Guide
//
//  Created by Ольга on 31.07.2022.
//

import Foundation
import UIKit

class ListOfPlacesViewController: UIViewController {
    
    var listOfPlaces = [Place]()
    var selectedPlace: Place?
    
    @IBOutlet weak var placesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placesTableView.delegate = self
        placesTableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {// #2 transfer information betwen VC
        if let infoWindowVC = segue.destination as? InfoWindowViewController {
            infoWindowVC.place = selectedPlace
        }
    }
}

extension ListOfPlacesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
        return 275
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected this cell")
        
        // Mag - listOfPlaces[0].name
        // Church - listOfPlaces[1].name
        // Post - listOfPlaces[2].name
        
        // 0 // 1 // 2 // 3 // 4
        
        selectedPlace = listOfPlaces[indexPath.row]
        
    
        performSegue(withIdentifier: "fullInfo", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfPlaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = placesTableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath) as! LocationInfoCell
        
        cell.placeNameLabel.text = listOfPlaces[indexPath.row].name
        cell.placeImage.image = UIImage(named: listOfPlaces[indexPath.row].imageName ?? "english")
        cell.placeInfoLabel.text = listOfPlaces[indexPath.row].address
        
        cell.selectionStyle = .none
        
        return cell
    }
    
   

}
