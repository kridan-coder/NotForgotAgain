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
    
    var viewModel: TasksListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.viewWasLoaded()
        
    }

}
