//
//  SceneDelegate.swift
//  UnlimintApp
//
//  Created by SUSHOBHIT JAIN on 07/05/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var mainCoordinator: Coordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let scene = (scene as? UIWindowScene) {
            let appWindow = UIWindow(windowScene: scene)
            let navigationController = UINavigationController()
            initializeMainCoordinator(navigationController)
            appWindow.backgroundColor = .white
            appWindow.rootViewController = navigationController
            appWindow.makeKeyAndVisible()
            window = appWindow
        }
    }

    func initializeMainCoordinator(_ nav: UINavigationController) {
        mainCoordinator = MainCoordinator(navigationController: nav)
        mainCoordinator?.start()
    }


}

