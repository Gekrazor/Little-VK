//
//  MainTabViewController.swift
//  Navigation
//
//  Created by Дмитрий Лещук on 04.05.2022.
//

import UIKit

class MainTabViewController: UITabBarController {
    
    private lazy var feedVC = FeedViewController()
    private lazy var profileVC = ProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }
    
    private func setupControllers() {
        let feedNC = UINavigationController(rootViewController: feedVC)
        feedVC.tabBarItem.title = "Feed"
        feedVC.tabBarItem.image = UIImage(named: "house.fill")
        
        let profileNC = UINavigationController(rootViewController: profileVC)
        profileVC.tabBarItem.title = "Profile"
        profileVC.tabBarItem.image = UIImage(named: "person.fill")
        
        viewControllers = [feedNC, profileNC]
    }
}
