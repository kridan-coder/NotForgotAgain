//
//  TableViewCellCategory.swift
//  NotForgotAgain
//
//  Created by KriDan on 23.04.2021.
//

import UIKit

class TableViewCellCategory: UITableViewCell {
    @IBOutlet weak var header: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // self.selectionStyle = .none
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //set the values for top,left,bottom,right margins
        let margins = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        
        contentView.frame = contentView.frame.inset(by: margins)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
