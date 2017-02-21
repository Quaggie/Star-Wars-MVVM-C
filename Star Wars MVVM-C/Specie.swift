//
//  Specie.swift
//  Star Wars MVVM-C
//
//  Created by Jonathan Bijos on 20/02/17.
//  Copyright © 2017 quaggie. All rights reserved.
//

import Foundation
import ObjectMapper

struct Specie: StarWarsModel, Mappable {
    var type: StarWarsType = .specie
    
    var name: String?
    var classification: String?
    var designation: String?
    var average_height: String?
    var average_lifespan: String?
    var eye_colors: String?
    var hair_colors: String?
    var skin_colors: String?
    var language: String?
    var homeworld: String?
    var people: [String]?
    var films: [String]?
    var url: String?
    var created: String?
    var edited: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        classification <- map["classification"]
        designation <- map["designation"]
        average_height <- map["average_height"]
        average_lifespan <- map["average_lifespan"]
        eye_colors <- map["eye_colors"]
        hair_colors <- map["hair_colors"]
        skin_colors <- map["skin_colors"]
        language <- map["language"]
        homeworld <- map["homeworld"]
        people <- map["people"]
        films <- map["films"]
        url <- map["url"]
        created <- map["name"]
        edited <- map["edited"]
    }
}
