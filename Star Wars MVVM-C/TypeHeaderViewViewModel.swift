//
//  TypeHeaderViewViewModel.swift
//  Star Wars MVVM-C
//
//  Created by Jonathan Bijos on 22/02/17.
//  Copyright © 2017 quaggie. All rights reserved.
//

import Foundation
import UIKit

class TypeHeaderViewViewModel: NSObject {
    var selectedType: StarWarsType = .person
    
    let types: [TypeModel] = [
        TypeModel(type: .person, image: #imageLiteral(resourceName: "icon_person")),
        TypeModel(type: .film, image: #imageLiteral(resourceName: "icon_film")),
        TypeModel(type: .starship, image: #imageLiteral(resourceName: "icon_starship")),
        TypeModel(type: .vehicle, image: #imageLiteral(resourceName: "icon_vehicle")),
        TypeModel(type: .specie, image: #imageLiteral(resourceName: "icon_specie")),
        TypeModel(type: .planet, image: #imageLiteral(resourceName: "icon_planet"))
    ]
}
