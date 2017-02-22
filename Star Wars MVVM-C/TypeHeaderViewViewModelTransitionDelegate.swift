//
//  TypeHeaderViewViewModelTransitionDelegate.swift
//  Star Wars MVVM-C
//
//  Created by Jonathan Bijos on 22/02/17.
//  Copyright © 2017 quaggie. All rights reserved.
//

import Foundation
import UIKit

protocol TypeHeaderViewViewModelTransitionDelegate {
    func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator)
}
