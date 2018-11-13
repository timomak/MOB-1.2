//
//  Movie.swift
//  API-Sandbox
//
//  Created by Dion Larson on 6/24/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation
import UIKit

struct Movie {
    let name: String?
    let rightsOwner: String?
    let price: Float?
    let link: String?
    let releaseDate: String?
    let imageLink: String?
    
    init(json: [String: [String: Any]]) {
        name = json["im:name"]!["label"] as? String ?? "No title found"
        rightsOwner = json["rights"]!["label"]! as? String ?? "No title found"
        price = json["im:price"]!["attributes"]!["amount"] as? String ?? "No title found"

//        self.rightsOwner = json["rights"]["label"].stringValue
//        self.price = json["im:price"]["attributes"]["amount"].floatValue
//        self.link = json["link"][0]["attributes"]["href"].stringValue
//        self.releaseDate = json["im:releaseDate"]["attributes"]["label"].stringValue
//        self.imageLink = json["im:image"][0]["label"].stringValue
    }
}
