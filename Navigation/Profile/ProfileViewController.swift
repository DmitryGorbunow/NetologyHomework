//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Dmitry Gorbunow on 10/7/22.
//

import UIKit

class ProfileViewController: UIViewController {

    var profileHeaderView = ProfileHeaderView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
        self.title = "Профиль"
    }

    override func viewWillLayoutSubviews() {
        profileHeaderView.frame = view.frame
        
    }
}
