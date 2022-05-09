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
        
        [avatarView, accountLabel, profileStatusLabel, statusButton, statusSetTextField] .forEach {addSubview($0)}
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let avatarView: UIImageView = {
        let avatarView = UIImageView(frame: CGRect(x: 16, y: 16, width: 100, height: 100))
        avatarView.image = UIImage(named: "Gutsu")
        avatarView.contentMode = .scaleAspectFit
        avatarView.clipsToBounds = true
        avatarView.layer.borderWidth = 3
        avatarView.layer.borderColor = UIColor.white.cgColor
        avatarView.layer.cornerRadius = avatarView.frame.height / 2.0
        avatarView.layer.masksToBounds = true
        return avatarView
    }()
    
    var accountLabel: UILabel = {
        let accountLabel = UILabel(frame: CGRect(x: 150, y: 27, width: 300, height: 18))
        accountLabel.text = "Guts Official"
        accountLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return accountLabel
    }()
    
    var profileStatusLabel: UILabel = {
        let accountLabel = UILabel(frame: CGRect(x: 150, y: 72, width: 300, height: 14))
        accountLabel.text = "I must take revenge"
        accountLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        accountLabel.textColor = .gray
        return accountLabel
    }()
    
    var statusButton: UIButton = {
        let statusButton = UIButton(frame: CGRect(x: 16, y: 153, width: 384, height: 50))
        statusButton.setTitle("Set status", for: .normal)
        statusButton.backgroundColor = .systemBlue
        statusButton.layer.cornerRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOffset.width = 4
        statusButton.layer.shadowOffset.height = 4
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowOpacity = 0.7
        statusButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
        return statusButton
    }()
    
    @objc private func tapButton() {
        if let text = status {
            print(text)
            profileStatusLabel.text = text
            statusSetTextField.text?.removeAll()
        } else {
            return
        }
    }
    
    var status: String?
    
    var statusSetTextField: UITextField = {
        let statusSetTextField = UITextField(frame: CGRect(x: 150, y: 99.5, width: 250, height: 40))
        statusSetTextField.layer.borderWidth = 1
        statusSetTextField.layer.borderColor = UIColor.black.cgColor
        statusSetTextField.backgroundColor = .white
        statusSetTextField.layer.cornerRadius = 12
        statusSetTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusSetTextField.textAlignment = .center
        statusSetTextField.placeholder = "Set new status"
        statusSetTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return statusSetTextField
    }()
    
    @objc private func statusTextChanged(_ textField: UITextField) {
        if let text = textField.text {
            status = text
        } else {
            return
        }
    }
}
