//
//  RegisterViewController.swift
//  NotForgotAgain
//
//  Created by KriDan on 18.04.2021.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    var viewModel: RegisterViewModel!
    
    @IBAction func goToLogin() {
        
        viewModel.goToLogin(from: self)
    }
}
