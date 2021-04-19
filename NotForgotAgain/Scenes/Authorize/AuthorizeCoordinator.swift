//
//  LoginCoordinator.swift
//  NotForgotAgain
//
//  Created by KriDan on 15.04.2021.
//

import Foundation
import UIKit

class AuthorizeCoordinator: Coordinator {
  
    // MARK: - Properties
  
    let rootViewNavigationController: UINavigationController

    weak var delegate: Coordinator?
    
    //let rootNavigationController = UINavigationController()

    //let xib = UINib(nibName: "Login", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    
    
    
    // MARK: VM / VC's
    lazy var loginViewModel: LoginViewModel! = {
        let viewModel = LoginViewModel()
        viewModel.coordinatorDelegate = self
        return viewModel
    }()
    
    lazy var registerViewModel: RegisterViewModel! = {
        let viewModel = RegisterViewModel()
        viewModel.coordinatorDelegate = self
        return viewModel
    }()

    // MARK: - Coordinator
    init(rootViewNavigationController: UINavigationController) {
        self.rootViewNavigationController = rootViewNavigationController
    }

    override func start() {
        
        let loginVC = LoginViewController(nibName: "Login", bundle: nil)
        loginVC.viewModel = loginViewModel
        
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


extension AuthorizeCoordinator {

    func goToRegister(from controller: UIViewController) {
        let registerVC: RegisterViewController = RegisterViewController(nibName: "Register", bundle: nil)
        registerVC.viewModel = registerViewModel
        controller.present(registerVC, animated: true, completion: nil)
    }
    
    func goToLogin(from controller: UIViewController) {
        let loginVC: LoginViewController = LoginViewController(nibName: "Login", bundle: nil)
        loginVC.viewModel = loginViewModel
        controller.present(loginVC, animated: true, completion: nil)
    }

    func goToTaskList(from controller: UIViewController) {
        //let searchCoordinator = SearchCoordinator(rootViewController: rootNavigationController, apiClient: apiClient, searchInput: validatedState)
        //searchCoordinator.delegate = self
        //addChildCoordinator(searchCoordinator)
        //searchCoordinator.start()
    }

}
