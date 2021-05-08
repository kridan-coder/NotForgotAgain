//
//  CreateRedactTasksCoordinator.swift
//  NotForgotAgain
//
//  Created by KriDan on 09.05.2021.
//

import Foundation
import UIKit

class CreateRedactTaskCoordinator: Coordinator {
  
    var apiClient: ApiClient
    
    // MARK: - Properties
  
    let rootViewNavigationController: UINavigationController

    weak var delegate: Coordinator?
    
    //let rootNavigationController = UINavigationController()

    //let xib = UINib(nibName: "Login", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    
    
    
    // MARK: VM / VC's
  
    

    // MARK: - Coordinator
    init(rootViewNavigationController: UINavigationController, apiClient: ApiClient) {
        self.rootViewNavigationController = rootViewNavigationController
        self.apiClient = apiClient
    }

    override func start() {
        
    
    }

    override func finish() {
        // Clean up any view controllers. Pop them of the navigation stack for example.
        //delegate?.didFinish(from: self)
    }
    
}

