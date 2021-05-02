//
//  TableViewCellTask.swift
//  NotForgotAgain
//
//  Created by KriDan on 23.04.2021.
//

import UIKit

class TableViewCellTask: UITableViewCell {

    @IBOutlet weak var checkBoxButton: UIButton!
    
    @IBOutlet weak var header: UILabel!

    @IBOutlet weak var subHeader: UILabel!
    
    @IBOutlet weak var wholeTask: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        wholeTask.layer.cornerRadius = 10
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //set the values for top,left,bottom,right margins
        let margins = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        contentView.frame = contentView.frame.inset(by: margins)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
