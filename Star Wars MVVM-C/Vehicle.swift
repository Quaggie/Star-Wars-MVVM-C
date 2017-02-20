//
//  Vehicle.swift
//  Star Wars MVVM-C
//
//  Created by Jonathan Bijos on 20/02/17.
//  Copyright © 2017 quaggie. All rights reserved.
//

import Foundation
import ObjectMapper

struct Vehicle: StarWarsModel, Mappable {
    
    var name: String?
    var model: String?
    var vehicle_class: String?
    var manufacturer: String?
    var length: String?
    var cost_in_credits: String?
    var crew: String?
    var passengers: String?
    var max_atmosphering_speed: String?
    var cargo_capacity: String?
    var consumables: String?
    var films: [String]?
    var pilots: [String]?
    var url: String?
    var created: String?
    var edited: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        model <- map["model"]
        vehicle_class <- map["vehicle_class"]
        manufacturer <- map["manufacturer"]
        length <- map["length"]
        cost_in_credits <- map["cost_in_credits"]
        crew <- map["crew"]
        passengers <- map["passengers"]
        max_atmosphering_speed <- map["max_atmosphering_speed"]
        cargo_capacity <- map["cargo_capacity"]
        consumables <- map["consumables"]
        films <- map["films"]
        pilots <- map["pilots"]
        url <- map["url"]
        created <- map["created"]
        edited <- map["edited"]
    }
}






