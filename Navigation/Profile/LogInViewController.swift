//
//  LogInViewController.swift
//  Navigation
//
//  Created by Дмитрий Лещук on 11.05.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    let myLogin = Account(login: "noName@gmail.com", password: "123456789")
    
    private lazy var notCenter: NotificationCenter = {
        let nc = NotificationCenter.default
        return nc
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        return contentView
    }()
    
    private lazy var VKImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "VKLogo")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var logInTextFieldsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .systemGray6
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.layer.borderColor = UIColor.systemGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.layer.masksToBounds = true
        return stackView
    }()
    
    private lazy var logInTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email or phone"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 10, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.tintColor = UIColor(named: "VKBlueColor")
        textField.autocapitalizationType = .none
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.delegate = self
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 10, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.tintColor = UIColor(named: "VKBlueColor")
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.delegate = self
        textField.addTarget(self, action: #selector(LogInViewController.textFieldShouldReturn(_:)), for: .editingDidEnd)
        return textField
    }()
    
    private lazy var attentionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .red
        label.text = "Password should have at least 6 symbols!"
        label.isHidden = true
        return label
    }()
    
    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.setBackgroundImage(UIImage(named: "blue_pixel")!.alpha(0.8), for: .highlighted)
        button.setBackgroundImage(UIImage(named: "blue_pixel")!.alpha(0.8), for: .selected)
        button.setBackgroundImage(UIImage(named: "blue_pixel")!.alpha(0.8), for: .disabled)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(logInTap), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func logInTap() {
        login()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    private func login() {
        if logInTextField.text!.isEmpty {
            Animations.shakingAnimation(on: logInTextField)
        } else if passwordTextField.text!.isEmpty {
            Animations.shakingAnimation(on: passwordTextField)
        } else if logInTextField.text != myLogin.login {
            let alert = UIAlertController(title: "Error", message: "Login is wrong", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default) {_ in
                self.dismiss(animated: true)
            }
            
            alert.addAction(okAction)
            present(alert, animated: true)
        } else if passwordTextField.text != myLogin.password {
            let alert = UIAlertController(title: "Error", message: "Password is wrong", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default) {_ in
                self.dismiss(animated: true)
            }
            
            alert.addAction(okAction)
            present(alert, animated: true)
        } else {
            let profileVC = ProfileViewController()
            navigationController?.pushViewController(profileVC, animated: true)
            attentionLabel.isHidden = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notCenter.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notCenter.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notCenter.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    @objc
    private func keyboardShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = kbdSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)
        }
    }
    
    @objc
    private func keyboardHide(notification: NSNotification) {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    // setuping views and constraits
    private func layout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [VKImage, logInTextFieldsStack, logInButton, attentionLabel].forEach { contentView.addSubview($0) }
        
        [logInTextField, passwordTextField].forEach { logInTextFieldsStack.addArrangedSubview($0) }
        
        let sideSpasing: CGFloat = 16
        
        // activating all views and make constraints
        NSLayoutConstraint.activate([
            // scrollView
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            // contentView
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // VKImage
            VKImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            VKImage.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 120),
            VKImage.heightAnchor.constraint(equalToConstant: 100),
            VKImage.widthAnchor.constraint(equalToConstant: 100),
            
            // logInTextFieldsStack
            logInTextFieldsStack.topAnchor.constraint(equalTo: VKImage.bottomAnchor, constant: 120),
            logInTextFieldsStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: sideSpasing),
            logInTextFieldsStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -sideSpasing),
            logInTextFieldsStack.heightAnchor.constraint(equalToConstant: 100),
            
            // logInTextField
            logInTextField.topAnchor.constraint(equalTo: logInTextFieldsStack.topAnchor),
            logInTextField.heightAnchor.constraint(equalToConstant: 50),
            
            // passwordTextField
            passwordTextField.bottomAnchor.constraint(equalTo: logInTextFieldsStack.bottomAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            // attntionLabel
            attentionLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 6),
            attentionLabel.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor, constant: 10),
            
            // logInButton
            logInButton.topAnchor.constraint(equalTo: attentionLabel.bottomAnchor, constant: sideSpasing),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: sideSpasing),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -sideSpasing),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -300)
        ])
    }
}

extension UIImage {
    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}

extension LogInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if self.passwordTextField.text == nil {
            self.passwordTextField.text = "" }
        if self.passwordTextField.text!.count < 6 {
            self.attentionLabel.isHidden = false }
        if self.passwordTextField.text!.count >= 6 {
            self.attentionLabel.isHidden = true }
        view.endEditing(true)
        return true
    }
}
