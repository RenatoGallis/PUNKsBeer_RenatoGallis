//
//  Beers.swift
//  38654RenatoGallis
//
//  Created by user132786 on 11/26/17.
//  Copyright © 2017 user132786. All rights reserved.
//

import Foundation
class Beers {
    
    
    var id: Int?
    var name: String
    var tagline: String
    var imageURL: String
    var abv: Double
    var ibu: Double
    var description: String
    
    
    init( name: String, tagline: String,imageURL : String,abv:Double, ibu: Double, description: String) {
        self.imageURL = imageURL
        self.name = name
        self.tagline = tagline
        self.abv = abv
        self.ibu = ibu
        self.description = description
    }
}
