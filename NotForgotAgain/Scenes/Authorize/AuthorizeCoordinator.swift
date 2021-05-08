//
//  LoginCoordinator.swift
//  NotForgotAgain
//
//  Created by KriDan on 15.04.2021.
//

import Foundation
import UIKit

class AuthorizeCoordinator: Coordinator {
  
    var apiClient: ApiClient
    
    // MARK: - Properties
  
    let rootViewNavigationController: UINavigationController

    weak var delegate: Coordinator?
    
    //let rootNavigationController = UINavigationController()

    //let xib = UINib(nibName: "Login", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    
    
    
    // MARK: VM / VC's
    lazy var loginViewModel: LoginViewModel! = {
        let viewModel = LoginViewModel()
        viewModel.coordinatorDelegate = self
        viewModel.apiClient = apiClient
        return viewModel
    }()
    
    lazy var registerViewModel: RegisterViewModel! = {
        let viewModel = RegisterViewModel()
        viewModel.coordinatorDelegate = self
        viewModel.apiClient = apiClient
        return viewModel
    }()

    // MARK: - Coordinator
    init(rootViewNavigationController: UINavigationController, apiClient: ApiClient) {
        self.rootViewNavigationController = rootViewNavigationController
        self.apiClient = apiClient
    }

    override func start() {
        
        let loginVC = LoginViewController(nibName: "Login", bundle: nil)
        loginVC.viewModel = loginViewModel
        loginVC.title = "Войти"
        rootViewNavigationController.setViewControllers([loginVC], animated: false)
    }

    override func finish() {
        // Clean up any view controllers. Pop them of the navigation stack for example.
        //delegate?.didFinish(from: self)
    }
    
}


//extension AuthorizeCoordinator: SearchCoordinatorDelegate {
//
//    func didFinish(from coordinator: SearchCoordinator) {
//        removeChildCoordinator(coordinator)
//    }
//
//}



extension AuthorizeCoordinator: RegisterViewModelDelegate, LoginViewModelDelegate {
    func goToCheckTasksScene(from: UIViewController) {
        
        let checkTasksCoordinator = CheckTasksCoordinator(rootViewNavigationController: rootViewNavigationController, apiClient: apiClient)
        checkTasksCoordinator.delegate = self
        addChildCoordinator(checkTasksCoordinator)
        checkTasksCoordinator.start()
    }

    func goToRegister(from controller: UIViewController) {
        let registerVC: RegisterViewController = RegisterViewController(nibName: "Register", bundle: nil)
        
        registerVC.viewModel = registerViewModel
        registerVC.title = "Создать аккаунт"
        registerVC.navigationItem.setHidesBackButton(true, animated: true)
        
        rootViewNavigationController.pushViewController(registerVC, animated: true)
        

        //controller.present(registerVC, animated: true, completion: nil)
    }
    
    func goToLogin(from controller: UIViewController) {
        rootViewNavigationController.popViewController(animated: true)
    }

    func goToTaskList(from controller: UIViewController) {
        //let searchCoordinator = SearchCoordinator(rootViewController: rootNavigationController, apiClient: apiClient, searchInput: validatedState)
        //searchCoordinator.delegate = self
        //addChildCoordinator(searchCoordinator)
        //searchCoordinator.start()
    }

}
