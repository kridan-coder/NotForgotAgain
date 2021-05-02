//
//  TasksListPageViewController.swift
//  NotForgotAgain
//
//  Created by KriDan on 22.04.2021.
//

import Foundation
import UIKit

class TasksListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var addTaskBigButton: UIButton!
    
    
    var viewModel: TasksListViewModel!
    
    func hideLayout(){
        tableView.isHidden = true
        stackView.isHidden = true
        addTaskBigButton.isHidden = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideLayout()
        viewModel.viewWasLoaded()
        
    }

}
