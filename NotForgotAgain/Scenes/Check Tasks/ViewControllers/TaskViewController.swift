//
//  TaskViewController.swift
//  NotForgotAgain
//
//  Created by KriDan on 22.04.2021.
//

import Foundation
import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var labelMarkDone: UILabel!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var neccessityLabel: UILabel!
    
    @IBOutlet weak var errorLabel: UILabel!
    var viewModel: TaskViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.viewWasLoaded()
        
    }

}
