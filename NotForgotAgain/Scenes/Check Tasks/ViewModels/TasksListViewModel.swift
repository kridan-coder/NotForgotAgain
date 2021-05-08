//
//  TasksListPageViewModel.swift
//  NotForgotAgain
//
//  Created by KriDan on 22.04.2021.
//

import Foundation

protocol TasksListViewModelDelegate{

}


class TasksListViewModel{
    var coordinatorDelegate: TasksListViewModelDelegate?
    var apiClient: ApiClient?
    //let tasksCollection: [CellTaskCollection]
    
    func viewWasLoaded(){
        
    }


}
