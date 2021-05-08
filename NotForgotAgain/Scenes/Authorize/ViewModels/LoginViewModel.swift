//
//  LoginViewModel.swift
//  NotForgotAgain
//
//  Created by KriDan on 17.04.2021.
//

import Foundation
import UIKit


protocol LoginViewModelDelegate{
    func goToRegister(from: UIViewController)
    func goToCheckTasksScene(from: UIViewController)
    
}

class LoginViewModel{
    var coordinatorDelegate: LoginViewModelDelegate?
    
    var apiClient: ApiClient?
    
    
    func goToRegister(from: UIViewController){
        coordinatorDelegate?.goToRegister(from: from)
    }
    
    func goToCheckTasksScene(from: UIViewController){
        coordinatorDelegate?.goToCheckTasksScene(from: from)
    }

}
