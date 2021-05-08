//
//  AppCoordinator.swift
//  NotForgotAgain
//
//  Created by KriDan on 15.04.2021.
//

import Foundation
import UIKit


class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    let window: UIWindow?
    
    let apiClient = ApiClient()
    
    lazy var rootViewNavigationController: UINavigationController = {
        var controller = UINavigationController()
        
        var appearance = UINavigationBarAppearance()
        appearance.shadowColor = .lightGray
        
        controller.navigationBar.prefersLargeTitles = true
        controller.navigationBar.scrollEdgeAppearance = appearance
        
        return controller
    }()

    // MARK: - Coordinator
    init(window: UIWindow?) {
        self.window = window
    }

    override func start() {
        guard let window = window else {
            return
        }

        window.rootViewController = rootViewNavigationController
        window.makeKeyAndVisible()
        
        let authorizeCoordinator = AuthorizeCoordinator(rootViewNavigationController: rootViewNavigationController, apiClient: apiClient)
        addChildCoordinator(authorizeCoordinator)
        authorizeCoordinator.start()
        
    }

    override func finish() {

    }

}
