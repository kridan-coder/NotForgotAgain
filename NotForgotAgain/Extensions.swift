//
//  Extensions.swift
//  NotForgotAgain
//
//  Created by KriDan on 20.04.2021.
//

import Foundation
import UIKit

extension UILabel{
    
    func generateNavigationControllerTitleLabelAppearance(withText text: String)
    {
        self.textAlignment = .left
        self.text = text
        self.sizeToFit()
        
    }
    
}
