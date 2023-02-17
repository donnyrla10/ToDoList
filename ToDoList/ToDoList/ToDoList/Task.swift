//
//  Task.swift
//  ToDoList
//
//  Created by 김영선 on 2023/02/17.
//

//MODEL

import Foundation

struct Task {
    var title: String
    var done: Bool
    
    init(title: String, done: Bool) {
        self.title = title
        self.done = done
    }
}
