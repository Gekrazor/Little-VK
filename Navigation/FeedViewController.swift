//
//  ViewController.swift
//  Navigation
//
//  Created by Дмитрий Лещук on 02.05.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .systemGray6
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var firstPostButton: UIButton = {
        let firstPostButton = UIButton()
        firstPostButton.setTitle("firstPostButton", for: .normal)
        firstPostButton.backgroundColor = .systemBlue
        firstPostButton.layer.cornerRadius = 4
        firstPostButton.layer.shadowColor = UIColor.black.cgColor
        firstPostButton.layer.shadowOffset.width = 4
        firstPostButton.layer.shadowOffset.height = 4
        firstPostButton.layer.shadowRadius = 4
        firstPostButton.layer.shadowOpacity = 0.7
        firstPostButton.addTarget(self, action: #selector(tapActionButton), for: .touchUpInside)
        firstPostButton.translatesAutoresizingMaskIntoConstraints = false
        return firstPostButton
    }()
    
    private lazy var secondPostButton: UIButton = {
        let secondPostButton = UIButton()
        secondPostButton.setTitle("secondPostButton", for: .normal)
        secondPostButton.backgroundColor = .systemBlue
        secondPostButton.layer.cornerRadius = 4
        secondPostButton.layer.shadowColor = UIColor.black.cgColor
        secondPostButton.layer.shadowOffset.width = 4
        secondPostButton.layer.shadowOffset.height = 4
        secondPostButton.layer.shadowRadius = 4
        secondPostButton.layer.shadowOpacity = 0.7
        secondPostButton.addTarget(self, action: #selector(tapActionButton), for: .touchUpInside)
        secondPostButton.translatesAutoresizingMaskIntoConstraints = false
        return secondPostButton
    }()
    
    @objc private func tapActionButton() {
       let postVC = PostViewController()
        postVC.somePost = Post(title: "Some post")
        navigationController?.pushViewController(postVC, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        stackSetup()
    }
    
    private func stackSetup() {
        view.addSubview(stackView)
        
        [firstPostButton, secondPostButton].forEach { stackView.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            // stackView
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 110),
            
            // firstPostButton
            firstPostButton.topAnchor.constraint(equalTo: stackView.topAnchor),
            firstPostButton.heightAnchor.constraint(equalToConstant: 50),
            
            // secondPostButton
            secondPostButton.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            secondPostButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
