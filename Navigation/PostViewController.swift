//
//  PostViewController.swift
//  Navigation
//
//  Created by Dmitry Gorbunow on 10/7/22.
//

import UIKit

class PostViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let postName = (self.navigationController?.viewControllers[0] as! FeedViewController).post.title
        view.backgroundColor = .brown
        self.title = postName
        let myButton = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(toInfoViewController))
        navigationItem.rightBarButtonItem = myButton
        
    }
    
    @objc func toInfoViewController() {
        let vc = InfoViewController()
        self.present(vc, animated: true)
    }
}
