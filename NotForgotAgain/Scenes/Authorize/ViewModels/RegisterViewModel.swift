//
//  RegisterViewModel.swift
//  NotForgotAgain
//
//  Created by KriDan on 18.04.2021.
//

import Foundation
import UIKit

protocol RegisterViewModelDelegate{
    func goToLogin(from: UIViewController)
}

class RegisterViewModel{
    var coordinatorDelegate: RegisterViewModelDelegate?
    
    func goToLogin(from: UIViewController){
        coordinatorDelegate?.goToLogin(from: from)
    }
    
}
