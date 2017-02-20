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
    
    var url: String?
    var created: String?
    var edited: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
    }
}
