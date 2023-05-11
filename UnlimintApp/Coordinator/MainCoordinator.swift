//
//  MainCoordinator.swift
//  UnlimintApp
//
//  Created by SUSHOBHIT JAIN on 28/04/23.
//

import UIKit

struct MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    mutating func start() {
        let root = getIntialScreen()
        switch root {
        case .jokeList:
            let coreDataManager = CoreDataManager.shared
            let storeManager: JokesStorageManagerProtocol = JokesStorageManager(coreDataManager: coreDataManager, limit: 10) // pass limit of jokes saved as per logic
            let jokeListCoordinator = JokeListCoodinator(navigationController: self.navigationController, storageManager: storeManager)
            self.store(coordinator: jokeListCoordinator)
            jokeListCoordinator.start()
        }
    }
    
    func getIntialScreen() -> RootModule {
        .jokeList // Add logic to select which screen to open
    }
}


enum RootModule {
    case jokeList
}
