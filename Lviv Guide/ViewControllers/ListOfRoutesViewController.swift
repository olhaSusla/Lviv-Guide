//
//  ListOfRoutesViewController.swift
//  Lviv Guide
//
//  Created by Ольга on 01.08.2022.
//

import Foundation
import UIKit

class ListOfRoutesViewController: UIViewController {
    @IBOutlet weak var routesTableView: UITableView!
    
    var routesList = [Route]()
    
    var completion: ((Route) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        routesTableView.delegate = self
        routesTableView.dataSource = self
    }
}

extension ListOfRoutesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(450 + routesList[indexPath.row].places.count * 20)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routesList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        completion?(routesList[indexPath.row])
        
        navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = routesTableView.dequeueReusableCell(withIdentifier: "routeCell", for: indexPath) as! RouteCell
        
        cell.routeTitleLabel.text = routesList[indexPath.row].name 
        cell.routeImage.image = UIImage(named: routesList[indexPath.row].imageName ?? "english")
        cell.shortDiscriptionLabel.text = routesList[indexPath.row].discription
        
        cell.places = routesList[indexPath.row].places
        cell.setupTableView()
        cell.tableView.reloadData()
    
        cell.selectionStyle = .none
        
        return cell
    }
}

