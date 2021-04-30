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
}

class LoginViewModel{
    var coordinatorDelegate: LoginViewModelDelegate?
    
    func goToRegister(from: UIViewController){
        coordinatorDelegate?.goToRegister(from: from)
    }

}
