//
//  TasksListPageViewModel.swift
//  NotForgotAgain
//
//  Created by KriDan on 22.04.2021.
//

import Foundation

protocol TasksListViewModelDelegate{
    func goToTask(task: Int)
}


class TasksListViewModel{
    var coordinatorDelegate: TasksListViewModelDelegate?
    var apiClient: ApiClient?
    //let tasksCollection: [CellTaskCollection]
    
    func viewWasLoaded(){
        
    }

    func goToTask(task: Int){
        coordinatorDelegate?.goToTask(task: task)
    }
}
