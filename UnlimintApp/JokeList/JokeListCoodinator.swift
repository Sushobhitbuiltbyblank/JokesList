//
//  JokeListCoodinator.swift
//  UnlimintApp
//
//  Created by SUSHOBHIT JAIN on 07/05/23.
//

import UIKit

struct JokeListCoodinator: JokeListCoodinatorProtocol {
    
    var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController
    var storageManager: JokesStorageManagerProtocol
    
    func start() {
        var vm: JokeListViewModelProtocol = JokeListViewModel(storeManager: storageManager)
        let vc = JokeListViewController(viewModel: vm)
        vm.view = vc
        self.navigationController.pushViewController(vc, animated: false)
    }
}
