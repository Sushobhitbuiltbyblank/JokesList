//
//  Coordinator.swift
//  UnlimintApp
//
//  Created by SUSHOBHIT JAIN on 28/04/23.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    mutating func start()
}

extension Coordinator {
    mutating func store(coordinator: Coordinator) {
    childCoordinators.append(coordinator)
  }
}
