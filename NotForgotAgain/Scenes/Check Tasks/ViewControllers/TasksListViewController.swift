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
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    let tableViewCellTaskId = "TableViewCellTask"
    let tableViewCellCategoryId = "TableViewCellCategory"
    var tasksCollection: [CellTaskGather] = []
    
    var viewModel: TasksListViewModel!
    
    func hardcodeTable()
    {
        var collection = [CellTaskGather]()
        
        var category = CellCategory()
        category.name = "Anime"
        
        var gather = CellTaskGather()
        gather.category = category
        
        collection.append(gather)
        
        for i in 0...10{
            let task = CellTask()
            task.checked = false
            task.description = "bla bla \(i)"
            task.header = "Da \(i+1)"
            task.id = i
            let gather = CellTaskGather()
            gather.task = task
            collection.append(gather)
        }
        
        category = CellCategory()
        category.name = "Naruto"
        
        gather = CellTaskGather()
        gather.category = category
        
        collection.append(gather)
        
        for i in 10...20{
            let task = CellTask()
            task.checked = true
            task.description = "glu glu \(i)"
            task.header = "Net \(i+1)"
            task.id = i
            let gather = CellTaskGather()
            gather.task = task
            collection.append(gather)
        }
        
        tasksCollection = collection
    }
    
    func hideLayout(){
        tableView.isHidden = true
        stackView.isHidden = true
        addTaskBigButton.isHidden = true
    }
    
    func loadingDone(){
        loader.stopAnimating()
    }
    
    func initTableView(){
        tableView.isHidden = false
        
        tableView.register(UINib.init(nibName: tableViewCellTaskId, bundle: nil), forCellReuseIdentifier: tableViewCellTaskId)
        tableView.register(UINib.init(nibName: tableViewCellCategoryId, bundle: nil), forCellReuseIdentifier: tableViewCellCategoryId)
        
        
        tableView.separatorColor = .clear
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideLayout()
        viewModel.viewWasLoaded()

        //temp
        loadingDone()
        hardcodeTable()
        initTableView()
        
    }

}

extension TasksListViewController: UITableViewDelegate{
    
}

extension TasksListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if tasksCollection[indexPath.item].category != nil{
            let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellCategoryId, for: indexPath) as! TableViewCellCategory
            
            cell.header.text = tasksCollection[indexPath.item].category?.name
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellTaskId, for: indexPath) as! TableViewCellTask
            
            
            cell.header.text = tasksCollection[indexPath.item].task?.header
            
            cell.subHeader.text = tasksCollection[indexPath.item].task?.description
            
            
            return cell
        
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if tasksCollection[indexPath.item].category != nil{
            return 74
        }
        else{
            return 90
        }
        
    }
    
}
