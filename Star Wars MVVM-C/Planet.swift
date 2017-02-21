//
//  Planet.swift
//  Star Wars MVVM-C
//
//  Created by Jonathan Bijos on 20/02/17.
//  Copyright © 2017 quaggie. All rights reserved.
//

import Foundation
import ObjectMapper

struct Planet: StarWarsModel, Mappable {
    var type: StarWarsType = .planet
    
    var name: String?
    var diameter: String?
    var rotation_period: String?
    var orbital_period: String?
    var gravity: String?
    var population: String?
    var climate: String?
    var terrain: String?
    var surface_water: String?
    var residents: [String]?
    var films: [String]?
    var url: String?
    var created: String?
    var edited: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        diameter <- map["diameter"]
        rotation_period <- map["rotation_period"]
        orbital_period <- map["orbital_period"]
        gravity <- map["gravity"]
        population <- map["population"]
        climate <- map["climate"]
        terrain <- map["terrain"]
        surface_water <- map["surface_water"]
        residents <- map["residents"]
        films <- map["films"]
        url <- map["url"]
        created <- map["created"]
        edited <- map["edited"]
    }
}
