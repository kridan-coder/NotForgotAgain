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
    
    var viewModel: TasksListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isHidden = true
        viewModel.viewWasLoaded()
        
    }

}
