//
//  TaskViewController.swift
//  NotForgotAgain
//
//  Created by KriDan on 22.04.2021.
//

import Foundation
import UIKit

class TaskViewController: UIViewController {
    
    var viewModel: TaskViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.viewWasLoaded()
        
    }

}
