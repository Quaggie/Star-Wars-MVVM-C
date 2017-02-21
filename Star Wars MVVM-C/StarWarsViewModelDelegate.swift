//
//  StarWarsViewModelDelegate.swift
//  Star Wars MVVM-C
//
//  Created by Jonathan Bijos on 20/02/17.
//  Copyright © 2017 quaggie. All rights reserved.
//

import Foundation

protocol StarWarsViewModelDelegate: class {
    func loadedData (data: Any?, finished: Bool)
    func loadedNextPage(data: Any?, finished: Bool)
    func onTypeSelected (selectedType: StarWarsType)
}
