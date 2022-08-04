//
//  CustomCell.swift
//  Lviv Guide
//
//  Created by Ольга on 31.07.2022.
//

import UIKit

class LocationInfoCell: UITableViewCell {

    @IBOutlet weak var placeImage: UIImageView!
    
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeInfoLabel: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 15
        
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
