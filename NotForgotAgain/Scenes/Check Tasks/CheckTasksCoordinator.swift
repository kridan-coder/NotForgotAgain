//
//  CheckTasksCoordinator.swift
//  NotForgotAgain
//
//  Created by KriDan on 22.04.2021.
//

import Foundation
import UIKit

class CheckTasksCoordinator: Coordinator{
    var rootViewNavigationController: UINavigationController
    
    weak var delegate: Coordinator?
    
    lazy var tasksListViewModel: TasksListViewModel! = {
        let viewModel = TasksListViewModel()
        viewModel.coordinatorDelegate = self
        return viewModel
    }()
    
    init(rootViewNavigationController: UINavigationController) {
        self.rootViewNavigationController = rootViewNavigationController
        

    }
    
    override func start() {
        
        let tasksListVC = TasksListViewController(nibName: "TasksList", bundle: nil)
        tasksListVC.viewModel = tasksListViewModel
        tasksListVC.title = "Список задач"
        tasksListVC.navigationItem.setHidesBackButton(true, animated: true)
        rootViewNavigationController.pushViewController(tasksListVC, animated: true)
    }
    
}


extension CheckTasksCoordinator: TasksListViewModelDelegate  {

}
