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
    var apiClient: ApiClient
    weak var delegate: Coordinator?
    
    lazy var tasksListViewModel: TasksListViewModel! = {
        let viewModel = TasksListViewModel()
        viewModel.coordinatorDelegate = self
        viewModel.apiClient = self.apiClient
        return viewModel
    }()
    
    init(rootViewNavigationController: UINavigationController, apiClient: ApiClient) {
        self.rootViewNavigationController = rootViewNavigationController
        self.apiClient = apiClient
        

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
