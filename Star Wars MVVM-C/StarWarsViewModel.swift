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
    
    init (starWarsModel: StarWarsModel?) {
        self.starWarsModel = starWarsModel
        fetchFilms()
    }
    
    func fetchFilms (page: Int = 1, provider: MoyaProvider<StarWarsService> = MoyaProvider<StarWarsService>()) {
//        provider.request(.fetchFilms(page: page)) { result in
//            switch result {
//            case .success(let response):
//                do {
//                    if let starWarsObject = try? response.mapObject(StarWarsObject<Film>.self) {
//                        print(starWarsObject)
//                    }
//                }
//                break
//            case .failure(let error):
//                print(error)
//                break
//            }
//        }
    }
}
