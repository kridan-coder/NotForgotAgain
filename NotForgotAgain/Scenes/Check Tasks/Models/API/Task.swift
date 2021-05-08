//
//  Task.swift
//  NotForgotAgain
//
//  Created by KriDan on 08.05.2021.
//

import Foundation
class Task: Decodable {
    var id: Int16? = nil
    var title: String? = nil
    var description: String? = nil
    var done: Int16? = nil
    var deadline: Date? = nil
    var category: Category? = nil
    var priority: Priority? = nil
    var created: Date? = nil
}
