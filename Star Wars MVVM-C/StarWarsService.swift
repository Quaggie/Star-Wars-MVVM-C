//
//  StarWarsService.swift
//  Star Wars MVVM-C
//
//  Created by Jonathan Bijos on 20/02/17.
//  Copyright © 2017 quaggie. All rights reserved.
//

import Foundation
import Moya

enum StarWarsService {
    case fetchPeople(page: Int)
    case fetchFilms(page: Int)
    case fetchStarships(page: Int)
    case fetchVehicles(page: Int)
    case fetchSpecies(page: Int)
    case fetchPlanets(page: Int)
}

extension StarWarsService: TargetType {
    var baseURL: URL {
        return URL(string: "http://swapi.co/api")!
    }
    var path: String {
        switch self {
        case .fetchPeople(_): return "/people"
        case .fetchFilms(_): return "/films"
        case .fetchStarships(_): return "/starships"
        case .fetchVehicles(_): return "/vehicles"
        case .fetchSpecies(_): return "/species"
        case .fetchPlanets(_): return "/planets"
        }
    }
    var method: Moya.Method {
        return .get
    }
    var parameters: [String: Any]? {
        switch self {
        case .fetchFilms(let page), .fetchPeople(let page), .fetchStarships(let page), .fetchVehicles(let page), .fetchSpecies(let page), .fetchPlanets(let page):
            return ["page": page]
        }
    }
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    var sampleData: Data {
        switch self {
        case .fetchFilms(_), .fetchPeople(_), .fetchStarships(_), .fetchVehicles(_), .fetchSpecies(_), .fetchPlanets(_):
            return "1".utf8Encoded
        }
    }
    var task: Task {
        return .request
    }
}























