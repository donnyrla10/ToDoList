//
//  ViewController.swift
//  ToDoList
//
//  Created by 김영선 on 2023/02/17.
//

import UIKit

class ViewController: UIViewController {
    var todolistViewModel = ToDoListViewModel()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    var doneButton: UIBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //done button
        self.doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTap))
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    @objc func doneButtonTap() {
        self.navigationItem.leftBarButtonItem = self.editButton
        self.tableView.setEditing(false, animated: true)
    }
    
    @IBAction func tapEditButton(_ sender: UIBarButtonItem) {
        guard !self.todolistViewModel.tasks.isEmpty else { return }
        self.navigationItem.leftBarButtonItem = doneButton
        self.tableView.setEditing(true, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    //섹션 내 행 개수 -> 리스트 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todolistViewModel.tasks.count
    }

    //해당 row(indexPath) 위치에 어떤 cell을 넣을 것인지! 넣을 cell 반환
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //가져올 셀의 identifier 값을 넣어야 한다.
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ToDoListViewCell
        //storyboard에서 정의한 cell을 dequeueReusableCell 메소드를 통해 가져온다.
        
        let task = self.todolistViewModel.tasks[indexPath.row] //indexPath.row -> 셀 위치 0~task.count
        cell.titleLabel.text = task.title
        cell.doneImage.image = UIImage(systemName: task.done ? "checkmark.circle" : "circle")
        
        //Basic Cell 사용할 경우
//        if #available(iOS 14.0, *) {
//            var content = cell.defaultContentConfiguration()
//            content.text = task.title
//            cell.contentConfiguration = content
//        } else {
//            cell.textLabel?.text = task.title //cell의 타이틀 값 넣기
//        }
        
        return cell //storyboard(view)에서 구현된 cell이 테이블뷰에 표시되게 된다
    }

    //편집모드에서 삭제를 눌렀을 때, 눌린 셀이 어떤 셀인지 알려준다
    //알려진 셀을 삭제한다.
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        self.tasks.remove(at: indexPath.row)
//        tableView.deleteRows(at: [indexPath], with: .automatic)
//
//        //할일 리스트가 없으면 그냥 나오기
//        if self.todolistViewModel.tasks.isEmpty {
//            self.doneButtonTap()
//        }
//    }

    //행이 이동가능하도록 한다
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    //행이 다른 위치로 이동하면, 원래 있었던 위치 sourceIndexPath, 어디로 갔는지 destinationIndexPath 알려준다.
    //이걸로 재정렬!
//    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        var tasks = self.tasks
//        let task = tasks[sourceIndexPath.row]
//        tasks.remove(at: sourceIndexPath.row)
//        tasks.insert(task, at: destinationIndexPath.row)
//        self.tasks = tasks
//    }
}

extension ViewController: UITableViewDelegate {
    //선택시, 어떤 셀이 선택되었는지 알려줌
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        //할일 리스트 배열(tasks)에 접근해서 done 프로퍼티 true -> false
//        var task = self.tasks[indexPath.row]
//        task.done = !task.done
//        self.tasks[indexPath.row] = task
//        self.tableView.reloadRows(at: [indexPath], with: .automatic)
//    }
}
