//
//  FeedViewController.swift
//  Navigation
//
//  Created by Dmitry Gorbunow on 10/7/22.
//

import UIKit

class FeedViewController: UIViewController {
    

    
    private lazy var vStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var openPostButton1: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.setTitle("Open post", for: .normal)
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.titleLabel?.textColor = .white
        setStatusButton.layer.cornerRadius = 14
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.addTarget(self, action: #selector(openPostButtonPressed), for: .touchUpInside)
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        return setStatusButton
    }()
    
    private lazy var openPostButton2: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.setTitle("Open post", for: .normal)
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.titleLabel?.textColor = .white
        setStatusButton.layer.cornerRadius = 14
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.addTarget(self, action: #selector(openPostButtonPressed), for: .touchUpInside)
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        return setStatusButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addSubviews()
        setupConstraints()
    }
    
    func setupView() {
        view.backgroundColor = .systemBackground
    }
    
    func addSubviews() {
        view.addSubview(vStack)
        vStack.addArrangedSubview(openPostButton1)
        vStack.addArrangedSubview(openPostButton2)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            vStack.heightAnchor.constraint(equalToConstant: view.frame.height / 8),
            vStack.widthAnchor.constraint(equalToConstant: view.frame.width / 2)
        ])
    }
    
    @objc func openPostButtonPressed() {
        let vc = PostViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
