//
//  StarWarsViewModel.swift
//  Star Wars MVVM-C
//
//  Created by Jonathan Bijos on 20/02/17.
//  Copyright © 2017 quaggie. All rights reserved.
//

import Foundation
import Moya
import Moya_ObjectMapper

class StarWarsViewModel {
    var starWarsModel: StarWarsModel? {
        didSet {
            delegate?.loadedData()
        }
    }
    var delegate: StarWarsViewModelDelegate?
    let starWarsProvider = MoyaProvider<StarWarsService>()
    
    init (starWarsModel: StarWarsModel?) {
        self.starWarsModel = starWarsModel
        fetch()
    }
    
    func fetch () {
        starWarsProvider.request(.fetch) { result in
            switch result {
            case .success(let response):
                // TODO: 
                print(response)
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
}
