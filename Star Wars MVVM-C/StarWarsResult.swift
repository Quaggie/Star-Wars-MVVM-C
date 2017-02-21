//
//  StarWarsResult.swift
//  Star Wars MVVM-C
//
//  Created by Jonathan Bijos on 21/02/17.
//  Copyright © 2017 quaggie. All rights reserved.
//

import Foundation
import ObjectMapper

enum StarWarsResult<T: Mappable> {
    case success(StarWarsObject<T>?)
    case failure(Error)
}
