//
//  Person.swift
//  Star Wars MVVM-C
//
//  Created by Jonathan Bijos on 20/02/17.
//  Copyright © 2017 quaggie. All rights reserved.
//

import Foundation
import ObjectMapper

struct Person: StarWarsModel, Mappable {
    var type: StarWarsType = .person
    
    var name: String?
    var birth_year: String?
    var eye_color: String?
    var gender: String?
    var hair_color: String?
    var height: String?
    var mass: String?
    var skin_color: String?
    var films: [String]?
    var species: [String]?
    var starships: [String]?
    var vehicles: [String]?
    var url: String?
    var created: String?
    var edited: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        birth_year <- map["birth_year"]
        eye_color <- map["eye_color"]
        gender <- map["gender"]
        hair_color <- map["hair_color"]
        height <- map["height"]
        mass <- map["mass"]
        skin_color <- map["skin_color"]
        films <- map["films"]
        species <- map["species"]
        starships <- map["starships"]
        vehicles <- map["vehicles"]
        url <- map["url"]
        created <- map["created"]
        edited <- map["edited"]
    }
}
