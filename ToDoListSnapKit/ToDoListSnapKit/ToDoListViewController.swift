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
        
        configureNavigationBar() //네비게이션바 커스텀
    }
    
    func configureNavigationBar() {
        //navigation bar
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.hidesBarsOnSwipe = true //scrolling이 일어나면 네비게이션 바를 가리도록
        //navigation bar button
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: nil, action: nil)
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
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
        
        typealias UIViewControllerType = UIViewController
    }
}
