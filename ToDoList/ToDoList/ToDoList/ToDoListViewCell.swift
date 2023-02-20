//
//  ToDoListViewCell.swift
//  ToDoList
//
//  Created by 김영선 on 2023/02/20.
//

import UIKit

class ToDoListViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var doneImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
