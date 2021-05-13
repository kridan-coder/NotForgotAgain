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
    
    @IBOutlet weak var taskGoalLabel: UILabel!
    @IBOutlet weak var neccessityLabel: UILabel!
    
    var viewModel: TaskViewModel!
    
    var taskData: Task!
    
    @IBOutlet weak var categoryLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryLabel.text = taskData.category?.name
        
        switch taskData.done {
        case 0:
            labelMarkDone.text = "Не выполнено"
        default:
            labelMarkDone.text = "Выполнено"
        }

        
        taskGoalLabel.text = taskData.title
        
        neccessityLabel.text = taskData.priority?.name
        
        descriptionTextView.text = taskData.description
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        let dateString = "До \(dateFormatter.string(from: taskData.deadline!))"
        timeLabel.text = dateString
        
        viewModel.viewWasLoaded()
        
    }

}
