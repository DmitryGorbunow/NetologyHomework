//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Dmitry Gorbunow on 11/15/22.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Дмитрий Горбунов"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var avatar: UIImageView = {
        let image = UIImage(named: "Man_with_bowler_hat_and_overcoat_generated")
        let imageView = UIImageView(image: image)
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = 75
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Напишите что-нибудь"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statusButton: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.setTitle("Показать статус", for: .normal)
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
    
    func setupStatusLabel() {
        statusLabel.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34).isActive = true
        statusLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        statusLabel.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 20).isActive = true
        statusLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
        
    func setupNameLabel() {
        nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 20).isActive = true
    }
    
    func setupAvatar() {
        avatar.widthAnchor.constraint(equalToConstant: 150).isActive = true
        avatar.heightAnchor.constraint(equalToConstant: 150).isActive = true
        avatar.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        avatar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
    }
    
    func setupStatusButton() {
        statusButton.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 16).isActive = true
        statusButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        statusButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        statusButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
    }
    
    @objc func buttonPressed() {
        print(statusLabel.text!)
    }
    
    override init(frame: CGRect) {
        super.init (frame: frame)
        addSubviews()
        setupNameLabel()
        setupAvatar()
        setupStatusButton()
        setupStatusLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(nameLabel)
        addSubview(avatar)
        addSubview(statusLabel)
        addSubview(statusButton)
    }
}
