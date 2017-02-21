//
//  Film.swift
//  Star Wars MVVM-C
//
//  Created by Jonathan Bijos on 20/02/17.
//  Copyright © 2017 quaggie. All rights reserved.
//

import Foundation
import ObjectMapper

struct Film: StarWarsModel, Mappable {
    var type: StarWarsType = .film
    
    var title: String?
    var episode_id: String?
    var opening_crawl: String?
    var director: String?
    var producer: String?
    var release_date: String?
    var species: [String]?
    var starships: [String]?
    var vehicles: [String]?
    var characters: [String]?
    var planets: [String]?
    var url: String?
    var created: String?
    var edited: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        title <- map["title"]
        episode_id <- map["episode_id"]
        opening_crawl <- map["opening_crawl"]
        director <- map["director"]
        producer <- map["producer"]
        release_date <- map["release_date"]
        species <- map["species"]
        starships <- map["starships"]
        vehicles <- map["vehicles"]
        characters <- map["characters"]
        planets <- map["planets"]
        url <- map["url"]
        created <- map["created"]
        edited <- map["edited"]
    }
}
