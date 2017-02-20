//
//  AppCoordinator.swift
//  Star Wars MVVM-C
//
//  Created by Jonathan Bijos on 20/02/17.
//  Copyright © 2017 quaggie. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var window: UIWindow?
    var childCoordinators: [String: Coordinator] = [:]
    weak var navigationController: UINavigationController?
    
    init (window: UIWindow?, navigationController: UINavigationController? = UINavigationController()) {
        self.window = window
        self.navigationController = navigationController
    }

    func start () {
        // let starWarsModel = StarWarsModel()
        let starWarsViewModel = StarWarsViewModel(starWarsModel: nil)
        let starWarsViewController = StarWarsViewController(starWarsViewModel: starWarsViewModel)
        navigationController?.pushViewController(starWarsViewController, animated: true)
    }
}
