//
//  ToDoListViewController.swift
//  ToDoListSnapKit
//
//  Created by 김영선 on 2023/02/15.
//

import UIKit
import SnapKit //auto layout
import SwiftUI //preview provider

class ToDoListViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//preview provider를 통해 UI 화면 바로 확인
struct ToDoListViewController_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }
    
    struct Container: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            let toDoListViewController = ToDoListViewController()
            return UINavigationController(rootViewController: toDoListViewController)
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            
        }
        
        typealias UIViewControllerType = UIViewController
    }
}
