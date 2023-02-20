//
//  AddListViewController.swift
//  ToDoList
//
//  Created by 김영선 on 2023/02/20.
//

import UIKit

class AddListViewController: UIViewController {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addButton.layer.cornerRadius = 5
        self.textField.layer.cornerRadius = 5
    }
    
    @IBAction func tapSaveButton(_ sender: UIButton) {
        
    }
}
