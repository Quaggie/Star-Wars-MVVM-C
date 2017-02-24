//
//  Api.swift
//  Star Wars MVVM-C
//
//  Created by Jonathan Bijos on 21/02/17.
//  Copyright © 2017 quaggie. All rights reserved.
//

import Foundation
import Moya
import Moya_ObjectMapper

struct Api {
    private init () {}
    static let shared = Api()
    
    func fetchFilms (page: Int = 1, provider: MoyaProvider<StarWarsService> = MoyaProvider<StarWarsService>(), completion: @escaping (StarWarsResult<Film>) -> Void) {
        provider.request(.fetchFilms(page: page)) { result in
            switch result {
            case .success(let response):
                do {
                    if let starWarsObject = try? response.mapObject(StarWarsObject<Film>.self) {
                        completion(StarWarsResult<Film>.success(starWarsObject))
                        break
                    }
                }
                completion(StarWarsResult<Film>.success(nil))
                break
            case .failure(let error):
                completion(StarWarsResult<Film>.failure(error))
                break
            }
        }
    }
    
    func fetchPeople (page: Int = 1, provider: MoyaProvider<StarWarsService> = MoyaProvider<StarWarsService>(), completion: @escaping (StarWarsResult<Person>) -> Void) {
        provider.request(.fetchPeople(page: page)) { result in
            switch result {
            case .success(let response):
                do {
                    if let starWarsObject = try? response.mapObject(StarWarsObject<Person>.self) {
                        completion(StarWarsResult<Person>.success(starWarsObject))
                    }
                }
                break
            case .failure(let error):
                completion(StarWarsResult<Person>.failure(error))
                break
            }
        }
    }
}
