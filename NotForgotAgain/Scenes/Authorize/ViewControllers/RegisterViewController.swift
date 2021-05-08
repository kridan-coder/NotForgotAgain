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
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for textField in textFields{
            textField.addUnderline()
        }
    }
    
    func success(response: SignUpSuccess){
        if let token = response.api_token{
            let defaults = UserDefaults.standard
            defaults.set(token, forKey: defaultKeys.token)
            viewModel.goToCheckTasksScene(from: self)
        }

    }
    
    @IBAction func registerButtonPressed() {
        guard let nameText = nameField.text else {return}
        guard let emailText = emailField.text else {return}
        guard let passwordText = passwordField.text else {return}
        let parameter = SignUp(email: emailText, name: nameText, password: passwordText)
        viewModel.apiClient?.signUp(requestData: parameter, onSuccess: {response in
            self.success(response: response)
        }, onFailure: {_ in})
        
        //viewModel.goToCheckTasksScene(from: self)
    }
    @IBAction func goToLogin() {
        
        viewModel.goToLogin(from: self)
    }
}
