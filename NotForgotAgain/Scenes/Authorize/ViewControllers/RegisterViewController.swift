//
//  RegisterViewController.swift
//  NotForgotAgain
//
//  Created by KriDan on 18.04.2021.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    var viewModel: RegisterViewModel!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passwordRepeatField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for textField in textFields{
            textField.addUnderline()
            textField.delegate = self
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        if let nextField = textField.superview?.viewWithTag(nextTag){
            nextField.becomeFirstResponder()
        }
        else {
            textField.resignFirstResponder()
        }

        return true
    }
    func success(response: SignUpSuccess){
        if let token = response.api_token{
            let defaults = UserDefaults.standard
            defaults.set(token, forKey: defaultKeys.token)
            viewModel.goToCheckTasksScene(from: self)
        }
        else {
            setError(error: "Ошибка регистрации. Попробуйте снова.")
        }

    }
    
    func setError(error: String){
        errorLabel.text = error
        errorLabel.isHidden = false
    }
    
    @IBAction func registerButtonPressed() {
        guard let nameText = nameField.text else {return}
        guard let emailText = emailField.text else {return}
        guard let passwordText = passwordField.text else {return}
        guard let passwordRepeatText = passwordRepeatField.text else {return}
        if (passwordText != passwordRepeatText) {
            setError(error: "Пароли не совпадают.")
            return
        }
        if (!emailText.contains("@")) {
            setError(error: "Убедитесь, что почта верна.")
            return
        }
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
