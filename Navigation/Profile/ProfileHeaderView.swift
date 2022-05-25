//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Дмитрий Лещук on 09.05.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewsSetup()
        avatarTapGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private lazy var avatarView: UIImageView = {
        let avatarView = UIImageView()
        avatarView.image = UIImage(named: "Gutsu")
        avatarView.contentMode = .scaleAspectFill
        avatarView.clipsToBounds = true
        avatarView.layer.borderWidth = 3
        avatarView.layer.borderColor = UIColor.white.cgColor
        avatarView.layer.cornerRadius = avatarView.intrinsicContentSize.height / 5
        avatarView.layer.masksToBounds = true
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        avatarView.backgroundColor = .black
        return avatarView
    }()
    
    private lazy var accountLabel: UILabel = {
        let accountLabel = UILabel()
        accountLabel.text = "Guts Official"
        accountLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        accountLabel.translatesAutoresizingMaskIntoConstraints = false
        return accountLabel
    }()
    
    private lazy var profileStatusLabel: UILabel = {
        let accountLabel = UILabel()
        accountLabel.text = "I must take revenge"
        accountLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        accountLabel.textColor = .gray
        accountLabel.translatesAutoresizingMaskIntoConstraints = false
        return accountLabel
    }()
    
    private lazy var statusButton: UIButton = {
        let statusButton = UIButton()
        statusButton.setTitle("Set status", for: .normal)
        statusButton.backgroundColor = .systemBlue
        statusButton.layer.cornerRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOffset.width = 4
        statusButton.layer.shadowOffset.height = 4
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowOpacity = 0.7
        statusButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        return statusButton
    }()
    
    @objc
    private func tapButton() {
        if let text = status {
            print(text)
            profileStatusLabel.text = text
            statusSetTextField.text?.removeAll()
        } else {
            print("Input status.")
        }
    }
    
    var status: String?
    
    private lazy var statusSetTextField: UITextField = {
        let statusSetTextField = UITextField()
        statusSetTextField.layer.borderWidth = 1
        statusSetTextField.layer.borderColor = UIColor.black.cgColor
        statusSetTextField.backgroundColor = .white
        statusSetTextField.layer.cornerRadius = 12
        statusSetTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusSetTextField.textAlignment = .center
        statusSetTextField.placeholder = "Set new status"
        statusSetTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        statusSetTextField.translatesAutoresizingMaskIntoConstraints = false
        return statusSetTextField
    }()
    
    private lazy var hiddenView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.opacity = 0
        view.frame.size.height = UIScreen.main.bounds.height
        view.frame.size.width = UIScreen.main.bounds.width
        view.center = CGPoint(x: UIScreen.main.bounds.width - (UIScreen.main.bounds.width / 2), y: UIScreen.main.bounds.height - (UIScreen.main.bounds.height / 2))
        return view
    }()
    
    private lazy var hiddenButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.opacity = 0
        button.setImage(UIImage(named: "pip.exit"), for: .normal)
        button.addTarget(self, action: #selector(tapExitAction), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func tapExitAction() {
        UIImageView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
            self.hiddenView.layer.opacity = 0
            self.avatarView.layer.cornerRadius = self.avatarView.intrinsicContentSize.height / 5
            self.avatarView.layer.frame = CGRect(origin: CGPoint(x: 16, y: 16), size: CGSize(width: 100, height: 100))
        } completion: { _ in
            self.hiddenButton.layer.opacity = 0
        }
    }
    
    @objc
    private func statusTextChanged(_ textField: UITextField) {
        if let text = textField.text {
            status = text
        } else {
            print("Status is empty.")
        }
    }
    
    private func avatarTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        avatarView.addGestureRecognizer(tapGesture)
        avatarView.isUserInteractionEnabled = true
    }
    
    @objc
    private func tapAction() {
        UIImageView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
            self.hiddenView.layer.opacity = 0.7
            self.avatarView.center = CGPoint(x: 50, y: UIScreen.main.bounds.height / 2 - (UIScreen.main.bounds.width / 2 + 60))
            self.avatarView.layer.cornerRadius = 0
            self.avatarView.layer.frame.size.height = UIScreen.main.bounds.width
            self.avatarView.layer.frame.size.width = UIScreen.main.bounds.width
        } completion: { _ in
            UIImageView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) {
                self.hiddenButton.layer.opacity = 1
            }
        }
    }
    
    private func viewsSetup() {
        [accountLabel, profileStatusLabel, statusButton, statusSetTextField, hiddenView, hiddenButton, avatarView].forEach { addSubview($0) }
        
        // activating all views
        NSLayoutConstraint.activate([
            // avatarView
            avatarView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarView.widthAnchor.constraint(equalToConstant: 100),
            avatarView.heightAnchor.constraint(equalToConstant: 100),
            
            // accountLabel
            accountLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            accountLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 30),
            
            // hiddenButton
            hiddenButton.topAnchor.constraint(equalTo: accountLabel.topAnchor),
            hiddenButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // statusButton
            statusButton.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: 16),
            statusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            
            // profileStatusLabel
            profileStatusLabel.bottomAnchor.constraint(equalTo: statusSetTextField.topAnchor, constant: -7),
            profileStatusLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 30),
            
            // statusSetTextField
            statusSetTextField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -7),
            statusSetTextField.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 30),
            statusSetTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusSetTextField.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}
