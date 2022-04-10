//
//  BetanoCoordinator.swift
//  Betano
//
//  Created by Yuri on 06/04/2022.
//

import UIKit

class BetanoCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = BetanoViewController.instantiate(storyboardName: .betano)
        viewController.coordinator = self
        viewController.viewModel = BetanoViewModel()
        navigationController.pushViewController(viewController, animated: true)
    }
    
    
}
