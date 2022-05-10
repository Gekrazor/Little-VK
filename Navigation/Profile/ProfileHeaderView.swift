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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let avatarView: UIImageView = {
        let avatarView = UIImageView()
        avatarView.image = UIImage(named: "Gutsu")
        avatarView.contentMode = .scaleAspectFit
        avatarView.clipsToBounds = true
        avatarView.layer.borderWidth = 3
        avatarView.layer.borderColor = UIColor.white.cgColor
        avatarView.layer.cornerRadius = avatarView.intrinsicContentSize.height / 5
        avatarView.layer.masksToBounds = true
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        return avatarView
    }()
    
    let accountLabel: UILabel = {
        let accountLabel = UILabel()
        accountLabel.text = "Guts Official"
        accountLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        accountLabel.translatesAutoresizingMaskIntoConstraints = false
        return accountLabel
    }()
    
    let profileStatusLabel: UILabel = {
        let accountLabel = UILabel()
        accountLabel.text = "I must take revenge"
        accountLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        accountLabel.textColor = .gray
        accountLabel.translatesAutoresizingMaskIntoConstraints = false
        return accountLabel
    }()
    
    let statusButton: UIButton = {
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
    
    @objc private func tapButton() {
        if let text = status {
            print(text)
            profileStatusLabel.text = text
            statusSetTextField.text?.removeAll()
        } else {
            print("Input status.")
        }
    }
    
    var status: String?
    
    let statusSetTextField: UITextField = {
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
    
    @objc private func statusTextChanged(_ textField: UITextField) {
        if let text = textField.text {
            status = text
        } else {
            print("Status is empty.")
        }
    }
    
    private func viewsSetup() {
        [avatarView, accountLabel, profileStatusLabel, statusButton, statusSetTextField].forEach { addSubview($0) }
        
        // activating all views
        NSLayoutConstraint.activate([
            // avatarView
            avatarView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarView.widthAnchor.constraint(equalToConstant: 100),
            avatarView.heightAnchor.constraint(equalToConstant: 100),
            
            // accountLabel
            accountLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            accountLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 30),
            
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
            statusSetTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
