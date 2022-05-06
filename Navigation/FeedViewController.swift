//
//  ViewController.swift
//  Navigation
//
//  Created by Дмитрий Лещук on 02.05.2022.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeButtonToPost()
    }
    
    private func makeButtonToPost() {
        let buttonToPost = UIBarButtonItem(title: "To post", style: .plain, target: self, action: #selector(tapButton))
        navigationItem.rightBarButtonItem = buttonToPost
    }
    
    @objc private func tapButton() {
        let postVC = PostViewController()
        postVC.somePost = Post(title: "Post to say sorry")
        navigationController?.pushViewController(postVC, animated: true)
    }
}
