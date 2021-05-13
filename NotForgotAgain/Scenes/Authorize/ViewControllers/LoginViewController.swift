//
//  LoginViewController.swift
//  NotForgotAgain
//
//  Created by KriDan on 17.04.2021.
//

import Foundation
import UIKit
import Alamofire



class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
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
    
    func setError(error: String){
        errorLabel.text = error
        errorLabel.isHidden = false
    }
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
        errorLabel.isHidden = true
        emailField.delegate = self
        passwordField.delegate = self
        for textField in textFields {
            textField.addUnderline()
        }
    }
    
    
    @IBAction func authorizeButtonPressed() {
        //URLEncoding(destination: .queryString)
        makeRequest()
    }
    
    
    func makeRequest(){
        guard let emailText = emailField.text else {return}
        guard let passwordText = passwordField.text else {return}
        if (!emailText.contains("@")) {
            setError(error: "Убедитесь, что почта верна.")
            return
        }
        let parameter = SignIn(email: emailText, password: passwordText)
        viewModel.apiClient?.signIn(requestData: parameter, onSuccess: {response in
            self.loginSuccess(response: response)
        }, onFailure: {error in
            self.loginFailure(errorMessage: error)
        })
    }
    
    func loginFailure(errorMessage: String){
        UIView.animate(withDuration: 3){
            self.errorLabel.text = errorMessage
            self.errorLabel.isHidden = false
        }
    }
    
    func loginSuccess(response: SignInSuccess){
        if let token = response.api_token{
            let defaults = UserDefaults.standard
            defaults.set(token, forKey: defaultKeys.token)
            viewModel.goToCheckTasksScene(from: self)
        }
        else
        {
            loginFailure(errorMessage: "Unexpected Error")
        }

    }
    
    @IBAction func goToRegisterButtonPressed() {
        viewModel.goToRegister(from: self)
    }
    
}
