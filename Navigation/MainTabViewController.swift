//
//  MainTabViewController.swift
//  Navigation
//
//  Created by Дмитрий Лещук on 04.05.2022.
//

import UIKit

class MainTabViewController: UITabBarController {
    
    let feedVC = FeedViewController()
    let profileVC = ProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }
    
    private func setupControllers() {
        let feedNC = UINavigationController(rootViewController: feedVC)
        feedVC.tabBarItem.title = "News feed"
        feedVC.tabBarItem.image = UIImage(named: "newspaper.fill")
        
        let profileNC = UINavigationController(rootViewController: profileVC)
        profileVC.tabBarItem.title = "Profile"
        profileVC.tabBarItem.image = UIImage(named: "person")
        
        viewControllers = [feedNC, profileNC]
    }
}
