//
//  ApiClient.swift
//  NotForgotAgain
//
//  Created by KriDan on 15.04.2021.
//

import Foundation
import Alamofire


class ApiClient{

    let baseURL = "http://practice.mobile.kreosoft.ru/api/"
    
    func signIn(requestData: SignIn, onSuccess: @escaping (SignInSuccess) -> Void, onFailure: @escaping (String) -> Void) {
        
        AF.request(baseURL + "login", method: .post, parameters: requestData, encoder: JSONParameterEncoder.default)
            .response { response in
                switch response.result {
                case .success(let data):
                    onSuccess(try! JSONDecoder().decode(SignInSuccess.self, from: data!))
                case .failure(let error):
                    onFailure(error.errorDescription ?? "Unhandled Error")
                }
            }
    }
    
    func signUp(requestData: SignUp, onSuccess: @escaping (SignUpSuccess) -> Void, onFailure: @escaping (String) -> Void) {
        
        AF.request(baseURL + "register", method: .post, parameters: requestData, encoder: JSONParameterEncoder.default)
            .response { response in
                switch response.result {
                case .success(let data):
                    onSuccess(try! JSONDecoder().decode(SignUpSuccess.self, from: data!))
                case .failure(let error):
                    onFailure(error.errorDescription ?? "Unhandled Error")
                }
            }
    }
    
    func getTasks(onSuccess: @escaping ([Task]?) -> Void, onFailure: @escaping (String) -> Void) {
        
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: defaultKeys.token) else {return}
        
        let httpHeaders: HTTPHeaders = ["Authorization" : "Bearer \(token)", "Accept" : "aplication/json"]
        
        AF.request(baseURL + "tasks", method: .get, encoding: URLEncoding(destination: .queryString), headers: httpHeaders)
            .response { response in
                switch response.result {
                case .success(let data):
                    onSuccess(try! JSONDecoder().decode([Task].self, from: data!))
                case .failure(let error):
                    onFailure(error.errorDescription ?? "Unhandled Error")
                }
            }
    }
    
}
