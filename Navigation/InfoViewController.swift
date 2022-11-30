//
//  InfoViewController.swift
//  Navigation
//
//  Created by Dmitry Gorbunow on 10/7/22.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray

        let uiButton = UIButton()
        self.view.addSubview(uiButton)
        uiButton.setTitle("Alert", for: .normal)
        uiButton.setTitleColor(.black, for: .normal)
        uiButton.translatesAutoresizingMaskIntoConstraints = false
        uiButton.addAction(UIAction(handler: {_ in
            let vc = UIAlertController()
            self.present(vc, animated: true)
        }), for: .touchUpInside)
        NSLayoutConstraint.activate([uiButton.centerYAnchor.constraint(equalTo: view.centerYAnchor), uiButton.leadingAnchor.constraint(equalTo: view.leadingAnchor), uiButton.trailingAnchor.constraint(equalTo: view.trailingAnchor), uiButton.heightAnchor.constraint(equalToConstant: 30)])
    }
}
