//
//  FeedViewController.swift
//  Navigation
//
//  Created by Dmitry Gorbunow on 10/7/22.
//

import UIKit

class FeedViewController: UIViewController {
    
    let post = Post(title: "Это пост")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let uiButton = UIButton()
        self.view.addSubview(uiButton)
        uiButton.setTitle("Пост", for: .normal)
        uiButton.setTitleColor(.black, for: .normal)
        uiButton.translatesAutoresizingMaskIntoConstraints = false
        uiButton.addAction(UIAction(handler: {_ in
            let vc = PostViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }), for: .touchUpInside)
        NSLayoutConstraint.activate([uiButton.centerYAnchor.constraint(equalTo: view.centerYAnchor), uiButton.leadingAnchor.constraint(equalTo: view.leadingAnchor), uiButton.trailingAnchor.constraint(equalTo: view.trailingAnchor), uiButton.heightAnchor.constraint(equalToConstant: 30)])
    }
}
