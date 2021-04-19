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
    
    lazy var rootViewNavigationController = UINavigationController()

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
        
        let authorizeCoordinator = AuthorizeCoordinator(rootViewNavigationController: rootViewNavigationController)
        addChildCoordinator(authorizeCoordinator)
        authorizeCoordinator.start()
        
    }

    override func finish() {

    }

}
