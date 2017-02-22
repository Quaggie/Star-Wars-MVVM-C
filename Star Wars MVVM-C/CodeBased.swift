//
//  CodeBased.swift
//  Star Wars MVVM-C
//
//  Created by Jonathan Bijos on 21/02/17.
//  Copyright © 2017 quaggie. All rights reserved.
//

import Foundation
import UIKit

protocol CodeBased: class {
    func setupViews ()
}

extension CodeBased where Self: UICollectionViewCell {
    static var reuseId: String {
        return String(describing: self)
    }
}

extension CodeBased where Self: UICollectionReusableView {
    static var reuseId: String {
        return String(describing: self)
    }
}
