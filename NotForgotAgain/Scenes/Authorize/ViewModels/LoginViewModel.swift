//
//  LoginViewModel.swift
//  NotForgotAgain
//
//  Created by KriDan on 17.04.2021.
//

import Foundation
import UIKit


class LoginViewModel{
    weak var coordinatorDelegate: AuthorizeCoordinator?
    
    func goToRegister(from: UIViewController){
        coordinatorDelegate?.goToRegister(from: from)
    }

}
