//
//  InfoWindowViewController.swift
//  Lviv Guide
//
//  Created by Ольга on 26.07.2022.
//

import Foundation
import UIKit
import AVFoundation

class InfoWindowViewController: UIViewController {
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeInfoLabel: UILabel!
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var audioLabel: UIButton!
    
    @IBOutlet weak var infoButton: UIButton!
 
    
    var place: Place?
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoButton.layer.cornerRadius = 15
        infoButton.layer.borderWidth = 2
        infoButton.layer.borderColor = UIColor.systemGray2.cgColor
        
        audioLabel.layer.cornerRadius = 15

        audioLabel.layer.borderWidth = 2
        audioLabel.layer.borderColor = UIColor.systemGray2.cgColor
        
     
        self.audioPlayer = AVAudioPlayer()
        
        placeNameLabel.text = place?.name
        placeInfoLabel.text = place?.info
        placeImage.image = UIImage(named: place?.imageName ?? "english")
        // place?.imageName ?? "english" || 1 ?? 2 || якщо 1 != nill то значення = 1 в іншому випадку значення = 2
       
        if place?.audioGuideName == nil {
            audioLabel.isHidden = true
        }
        
        let sound = URL(fileURLWithPath: Bundle.main.path(forResource: place?.audioGuideName, ofType: "m4a")!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: sound)
        } catch {}
    }
    
    var isAudioPlaying = false
    
    @IBAction func wikiInfoButton(_ sender: Any) {
        if let url = URL(string: place?.url ?? "") {
            UIApplication.shared.open(url)
            
        }
    }
    
    @IBAction func audioButton(_ sender: Any) {
        if isAudioPlaying {
            audioPlayer.pause()
            isAudioPlaying = false
            audioLabel.setTitle("Play", for: .normal)
        } else {
            audioPlayer.play()
            audioPlayer.volume = 1.0
            isAudioPlaying = true
            audioLabel.setTitle("Pause", for: .normal)
        }
    }

     
       
    
    
    
    // #1 TODO: Clean code, set correct names for variables +
    // #2 TODO: Hide Button if we don't have audio file.+
    // #3 TODO: Make posible to pause and play audio.+
    // #4 TODO: Open some page from URL + // min || max
    
    // #5 TODO: Create new VC+
    // #6 TODO: create segue to this VC+
    // #7 TODO: Add UITableView +
    // #8 TODO: Show all location using table view+
    //#9 TODO: add adrees to class, add picture
    //10 TODO: when tap on cell open info
    
    
}
