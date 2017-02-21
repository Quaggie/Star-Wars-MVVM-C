//
//  StarWarsObject.swift
//  Star Wars MVVM-C
//
//  Created by Jonathan Bijos on 20/02/17.
//  Copyright © 2017 quaggie. All rights reserved.
//

import Foundation
import ObjectMapper

struct StarWarsObject<T: Mappable>: Mappable {
    
    var count: Int?
    var next: String?
    var previous: String?
    var results: [T]?
    
    init? () {
        self.init()
    }
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        count <- map["count"]
        next <- map["next"]
        previous <- map["previous"]
        results <- map["results"]
    }
}
