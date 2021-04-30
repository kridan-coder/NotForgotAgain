//
//  LoginViewController.swift
//  NotForgotAgain
//
//  Created by KriDan on 17.04.2021.
//

import Foundation
import UIKit




class LoginViewController: UIViewController {
    
    var viewModel: LoginViewModel!
    
    
    @IBOutlet var textFields: [UITextField]!
    
//    override func viewWillAppear() {
//        super.viewWillAppear()
//        for textField in textFields {
//            textField.addUnderline()
//        }
//
//    }\
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        for textField in textFields {
            textField.addUnderline()
        }
    }
    
    
    @IBAction func authorizeButtonPressed() {
        
    }
    
    @IBAction func goToRegisterButtonPressed() {
        viewModel.goToRegister(from: self)
    }
    
}
