//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Dmitry Gorbunow on 11/15/22.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    static let identifire = "ProfileHeaderView"
    
    private var statusText: String?
    
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Dmitry Gorbunow"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let image = UIImage(named: "ava")
        let imageView = UIImageView(image: image)
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = 60
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Waiting for something..."
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var setStatusButton: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.setTitle("Set status", for: .normal)
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.titleLabel?.textColor = .white
        setStatusButton.layer.cornerRadius = 14
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        return setStatusButton
    }()

    @objc func buttonPressed() {
        statusLabel.text = statusText
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        self.statusText = textField.text
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(fullNameLabel)
        addSubview(avatarImageView)
        addSubview(statusLabel)
        addSubview(setStatusButton)
        addSubview(statusTextField)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant: 120),
            avatarImageView.heightAnchor.constraint(equalToConstant: 120),
            avatarImageView.safeAreaLayoutGuide.topAnchor.constraint(equalTo:safeAreaLayoutGuide.topAnchor,
            constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            fullNameLabel.topAnchor.constraint (equalTo: self.layoutMarginsGuide.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            fullNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            statusLabel.bottomAnchor.constraint (equalTo: setStatusButton.topAnchor, constant: -55),
            statusLabel.leadingAnchor.constraint (equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.topAnchor.constraint (equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            
            statusTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 142),
            statusTextField.topAnchor.constraint (equalTo: self.setStatusButton.topAnchor, constant: -50),
            statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
