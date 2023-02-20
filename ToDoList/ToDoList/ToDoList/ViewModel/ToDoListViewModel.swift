//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by 김영선 on 2023/02/20.
//

import Foundation

//모든 데이터와 관련된 기능은 여기서 진행!

class ToDoListViewModel : NSObject {
    //⭐️ single source of truth!
    var tasks: [Task] = [] {
        didSet {
            saveTask() //list에 새로운 원소 들어오면 saveTasks 호출
        }
    }
    
    //initial때 테스크 불러오기
    override init() {
        super.init()
        loadTasks()
    }
    
    func loadTasks() {
        guard let data = UserDefaults.standard.data(forKey: "list"),
              let saveTask = try? JSONDecoder().decode([Task].self, from: data) else { return }
        self.tasks = saveTask //저장된 테스크 배열로 갱신
    }
    
    //tasks에 task 추가되면 saveTask() 호출
    func addTask(_ title: String) {
        tasks.append(Task(title: title, done: false))
    }
    
    func saveTask() {
        if let data = try? JSONEncoder().encode(tasks) {
             UserDefaults.standard.set(data, forKey: "list") //앱에 저장
        }
    }
}
