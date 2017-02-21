//
//  Extensions.swift
//  Star Wars MVVM-C
//
//  Created by Jonathan Bijos on 20/02/17.
//  Copyright © 2017 quaggie. All rights reserved.
//

import Foundation
import SwifterSwift
import Moya

extension String {
    var utf8Encoded: Data {
        return self.data(using: .utf8)!
    }
    
    var urlPathId: (type: String?, id: String?) {
        var type: String?
        var id: String?
        if let components = self.url?.toURLComponents?.path.splitted(by: "/") {
            type = components.item(at: 1)
            id = components.item(at: 2)
        }
        return (type, id)
    }
    func getStarWarsService (path: String) -> StarWarsService {
        
        
        return .fetchFilms(page: 1)
    }
}
