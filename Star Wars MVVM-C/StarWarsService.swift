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
    case fetch
}

extension StarWarsService: TargetType {
    var baseURL: URL {
        return URL(string: "http://swapi.co/api")!
    }
    var path: String {
        switch self {
        case .fetch: return "/"
        }
    }
    var method: Moya.Method {
        switch self {
        case .fetch: return .get
        }
    }
    var parameters: [String : Any]? {
        switch self {
        case .fetch: return nil
        }
    }
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .fetch: return URLEncoding.default
        }
    }
    var sampleData: Data {
        switch self {
        case .fetch: return "".utf8Encoded
        }
    }
    var task: Task {
        switch self {
        case .fetch: return .request
        }
    }
}





















