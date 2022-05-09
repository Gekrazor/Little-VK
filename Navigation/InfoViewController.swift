//
//  InfoViewController.swift
//  Navigation
//
//  Created by Дмитрий Лещук on 04.05.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeBackButton()
    }
    
    private func makeBackButton() {
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        backButton.setTitle("Go back", for: .normal)
        backButton.center = view.center
        backButton.backgroundColor = .gray
        backButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        view.addSubview(backButton)
    }
    
    @objc private func tapButton() {
        let alert = UIAlertController(title: "Going back", message: "You wanna go back?", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes", style: .destructive) {_ in
            print("Yes")
            self.dismiss(animated: true)
        }
        
        let noAction = UIAlertAction(title: "No", style: .default) {_ in
            print("No")
        }
        
        alert.addAction(noAction)
        alert.addAction(yesAction)
        present(alert, animated: true)
    }
}
