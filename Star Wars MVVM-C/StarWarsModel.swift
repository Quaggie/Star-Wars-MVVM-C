//
//  StarWarsModel.swift
//  Star Wars MVVM-C
//
//  Created by Jonathan Bijos on 20/02/17.
//  Copyright © 2017 quaggie. All rights reserved.
//

import Foundation

protocol StarWarsModel {
    var url: String? { get }
    var created: String? { get }
    var edited: String? { get }
}
