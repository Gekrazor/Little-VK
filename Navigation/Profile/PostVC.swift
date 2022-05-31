//
//  PostVC.swift
//  Navigation
//
//  Created by Дмитрий Лещук on 26.05.2022.
//

import UIKit

class PostVC: UIViewController {
    
    lazy var postView: PostTableViewCell = {
        let view = PostTableViewCell()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layuout()
    }
    
    private func layuout() {
        view.addSubview(postView)
        
        NSLayoutConstraint.activate([
            postView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            postView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            postView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            postView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
