//
//  AddListViewController.swift
//  ToDoList
//
//  Created by 김영선 on 2023/02/20.
//

import UIKit

class AddListViewController: UIViewController {
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.saveButton.layer.cornerRadius = 5
        self.textField.layer.cornerRadius = 5
    }
    
    @IBAction func tapSaveButton(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? ViewController else { return }
        guard let title = textField.text else { return }
        vc.todolistViewModel.addTask(title)
        print(title)
        //이전 화면으로 돌아가기
        self.navigationController?.popViewController(animated: true)
    }
}
