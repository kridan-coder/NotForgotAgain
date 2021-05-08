//
//  SignUpSuccess.swift
//  NotForgotAgain
//
//  Created by KriDan on 08.05.2021.
//

import Foundation

struct SignUpSuccess: Decodable {
    var email: String? = nil
    var name: String? = nil
    var id: Int? = nil
    var api_token: String? = nil
}
