//
//  LogInViewController.swift
//  Navigation
//
//  Created by Dmitry Gorbunow on 12/6/22.
//

import UIKit
import Foundation

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    private var email = "email@gmail.com"
    private var password = "password"
    
    var textFieldTrailing: NSLayoutConstraint!
    var textFieldLeading: NSLayoutConstraint!
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.keyboardDismissMode = .onDrag
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    lazy var logo: UIImageView = {
        let image = UIImageView(image: UIImage(named: "logo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var loginStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.layer.borderColor = UIColor.lightGray.cgColor
        stack.layer.borderWidth = 0.5
        stack.layer.cornerRadius = 10
        stack.distribution = .fillProportionally
        stack.backgroundColor = .systemGray6
        stack.clipsToBounds = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email or phone"
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.addTarget(self, action: #selector(emailValid), for: .allEditingEvents)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.addTarget(self, action: #selector(textFieldWasChanged), for: .allEditingEvents)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var minPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Set minimum password length to at least a value of 8"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.textColor = .systemRed
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var logInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "vk_color")
        button.layer.cornerRadius = 10
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.textColor = .white

        if let imagePx = UIImage(named: "blue_pixel") {
            button.setBackgroundImage(imagePx.alpha(1), for: .normal)
            button.setBackgroundImage(imagePx.alpha(0.8), for: .selected)
            button.setBackgroundImage(imagePx.alpha(0.8), for: .highlighted)
            button.setBackgroundImage(imagePx.alpha(0.8), for: .disabled)
        }

        button.clipsToBounds = true
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.isHidden = true
        addSubviews()
        setupConstraints()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
        
    
    func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logo)
        contentView.addSubview(loginStackView)
        contentView.addSubview(logInButton)
        loginStackView.addArrangedSubview(emailTextField)
        loginStackView.addArrangedSubview(passwordTextField)
        view.addSubview(minPasswordLabel)
        minPasswordLabel.isHidden = true
    }

    
    func setupConstraints() {
        textFieldLeading = loginStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        textFieldTrailing =  loginStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            logo.widthAnchor.constraint(equalToConstant: 100),
            logo.heightAnchor.constraint(equalToConstant: 100),
            logo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),

            loginStackView.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 120),
            loginStackView.heightAnchor.constraint(equalToConstant: 100),
            textFieldLeading,
            textFieldTrailing,

            logInButton.topAnchor.constraint(equalTo: loginStackView.bottomAnchor, constant: 16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            minPasswordLabel.topAnchor.constraint(equalTo: loginStackView.topAnchor, constant: -20),
            minPasswordLabel.bottomAnchor.constraint(equalTo: loginStackView.topAnchor, constant: -5),
            minPasswordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            minPasswordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeKeyboardEvents()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    func subscribeKeyboardEvents() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        guard let keySize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
           return
        }
        self.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keySize.height + 80, right: 0)
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset = .zero
    }
    
    func textFieldAnimate(textField: UITextField) -> Bool {
        if textField.text == "" {
            textFieldLeading.constant = 21
            textFieldTrailing.constant = -11
            
            textField.backgroundColor = UIColor(named: "login")
            
            UIView.animate(withDuration: 0.1, animations: { [self] in
                UIView.modifyAnimations(withRepeatCount: 4, autoreverses: true) {
                    self.view.layoutIfNeeded()
                }
            })
            textFieldLeading.constant = 16
            textFieldTrailing.constant = -16
            return false
        } else {
            textField.backgroundColor = .systemBackground
            return true
        }
    }
    
   
    @objc func emailValid(_ textField: UITextField) {
        let emailPattern = #"^\S+@\S+\.\S+$"#
        
        let result = textField.text!.range(
            of: emailPattern,
            options: .regularExpression
        )

        let validEmail = (result != nil)
        
        if !validEmail {
            textField.backgroundColor = UIColor(named: "login")
        } else {
            textField.backgroundColor = UIColor(named: "loginGreen")
        }
    }
    
    @objc func textFieldWasChanged(_ textField: UITextField) {
        let textCount = textField.text?.count
        guard let tc = textCount else { return }
        
        if tc < 8 {
            textField.backgroundColor = UIColor(named: "login")
            minPasswordLabel.isHidden = false
        } else {
            textField.backgroundColor = UIColor(named: "loginGreen")
            minPasswordLabel.isHidden = true
        }
    }
    
    @objc func loginButtonPressed() {
        
        let alert = UIAlertController(title: "Incorrect Email or Password", message: "Please check your details and try again", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        }))
   
        guard textFieldAnimate(textField: emailTextField) && textFieldAnimate(textField: passwordTextField) else {
            return
        }
        
        if emailTextField.text == email && passwordTextField.text == password {
            let vc = ProfileViewController()
            navigationController?.setViewControllers([vc], animated: true)
        } else {
            textFieldLeading.constant = 21
            textFieldTrailing.constant = -11
            UIView.animate(withDuration: 0.1, animations: { [self] in
                UIView.modifyAnimations(withRepeatCount: 4, autoreverses: true) {
                    self.view.layoutIfNeeded()
                }
            })
            emailTextField.backgroundColor = UIColor(named: "login")
            passwordTextField.backgroundColor = UIColor(named: "login")
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
