//
//  PostViewController.swift
//  Navigation
//
//  Created by Дмитрий Лещук on 04.05.2022.
//

import UIKit

struct Post {
    var title: String
}

class PostViewController: UIViewController {
    
    var somePost: Post?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        makeButtonToInfo()
    }
    
    private func makeButtonToInfo() {
        let buttonToinfo = UIBarButtonItem(title: "To info", style: .plain, target: self, action: #selector(tapButton))
        navigationItem.rightBarButtonItem = buttonToinfo
    }
    
    @objc private func tapButton() {
        let infoVC = InfoViewController()
        
        present(infoVC, animated: true)
    }
}
