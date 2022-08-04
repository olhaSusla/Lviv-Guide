//
//  RouteCell.swift
//  Lviv Guide
//
//  Created by Ольга on 01.08.2022.
//

import UIKit

class RouteCell: UITableViewCell {
    
    
    @IBOutlet weak var routeTitleLabel: UILabel!
    @IBOutlet weak var routeImage: UIImageView!
    
    @IBOutlet weak var shortDiscriptionLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var places = [Place]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.containerView.layer.cornerRadius = 15
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension RouteCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "placeNameCell", for: indexPath) as! LocationNameCell
        
        cell.title.text = places[indexPath.row].name
        cell.selectionStyle = .none
        
        return cell
    }
}
