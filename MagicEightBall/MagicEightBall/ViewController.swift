//
//  ViewController.swift
//  MagicEightBall
//
//  Created by timofey makhlay on 10/25/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let startUp = ["Make School", "Uber", "Netflix", "Facebook", "Google", "Kickstarter", "Spotify", "Airbnb", "Snapchat", "YouTube", "Dropbox", "Amazon", "Craigslist", "Tinder", "Instagram", "Tesla", "Twitter", "SpaceX"]

    
    let adgective = ["Dogs", "Books", "Gamers", "Star Wars", "Bitcoin", "Goats", "Zombies", "Rich People", "Swimmers", "Florida", "Vampires", "Dragons", "Internet of Things", "Mars", "Cryptocurrency", "Mosquito Repellent", "Fidget Spinners", "Sun Screen", "Water Bottles", "Lost Travelers", "Superheroes"]
    
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var shakeButton: UIButton!
    @IBOutlet weak var adgectiveLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func shakeButtonTapped(_ sender: Any) {
        generateAnswer()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        generateAnswer()
    }
    
    func generateAnswer() {
        let maxIndex = UInt32(startUp.count)
        let randomIndex = Int(arc4random_uniform(maxIndex))
        
        let maxIndex2 = UInt32(adgective.count)
        let randomIndex2 = Int(arc4random_uniform(maxIndex2))
        
        answerLabel.text = startUp[randomIndex]
        adgectiveLabel.text = adgective[randomIndex2]
    }
    
}

