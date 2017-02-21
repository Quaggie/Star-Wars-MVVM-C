//
//  URL+Extension.swift
//  Star Wars MVVM-C
//
//  Created by Jonathan Bijos on 21/02/17.
//  Copyright © 2017 quaggie. All rights reserved.
//

import Foundation

extension URL {
    var toURLComponents: URLComponents? {
        return URLComponents(url: self, resolvingAgainstBaseURL: false)
    }
}
