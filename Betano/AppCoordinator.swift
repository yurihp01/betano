//
//  AppCoordinator.swift
//  Betano
//
//  Created by Yuri on 06/04/2022.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var parentCoordinator: Coordinator?
    
    init() {
        navigationController = UINavigationController()
    }
    
    func start() {
        let childCoordinator = BetanoCoordinator(navigationController: navigationController)
        childCoordinator.parentCoordinator = self
        add(childCoordinator)
        childCoordinator.start()
    }
}
