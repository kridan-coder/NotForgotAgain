//
//  RegisterViewModel.swift
//  NotForgotAgain
//
//  Created by KriDan on 18.04.2021.
//

import Foundation
import UIKit

class RegisterViewModel{
    weak var coordinatorDelegate: AuthorizeCoordinator?
    
    func goToLogin(from: UIViewController){
        coordinatorDelegate?.goToLogin(from: from)
    }
    
}
