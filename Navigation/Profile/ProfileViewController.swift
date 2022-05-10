//
//  ViewController.swift
//  Navigation
//
//  Created by Дмитрий Лещук on 04.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHV = ProfileHeaderView()
    
    let tapButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Tap button", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset.width = 4
        button.layer.shadowOffset.height = 4
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Profile"
        viewSetup()
    }
        
    private func viewSetup() {
        [profileHV, tapButton].forEach { view.addSubview($0) }
        profileHV.translatesAutoresizingMaskIntoConstraints = false
        profileHV.backgroundColor = .lightGray
        
        NSLayoutConstraint.activate([
            // profileHV
            profileHV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHV.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHV.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 220),
            
            // tapButton
            tapButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tapButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tapButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tapButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
