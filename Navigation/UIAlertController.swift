//
//  UIAlertController.swift
//  Navigation
//
//  Created by Dmitry Gorbunow on 10/7/22.
//

import UIKit

class UIAlertController: UIViewController {
    let massage = "Это сообщение"
    let mainTitle = "Alert"
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        self.title = mainTitle
        
        let uiButton = UIButton()
        self.view.addSubview(uiButton)
        uiButton.setTitle("Alert1", for: .normal)
        uiButton.setTitleColor(.black, for: .normal)
        uiButton.translatesAutoresizingMaskIntoConstraints = false
        uiButton.addAction(UIAction(handler: {_ in
            print(self.massage)
        }), for: .touchUpInside)
        NSLayoutConstraint.activate([uiButton.centerYAnchor.constraint(equalTo: view.centerYAnchor), uiButton.leadingAnchor.constraint(equalTo: view.leadingAnchor), uiButton.trailingAnchor.constraint(equalTo: view.trailingAnchor), uiButton.heightAnchor.constraint(equalToConstant: 30)])
        
        let uiButton1 = UIButton()
        self.view.addSubview(uiButton1)
        uiButton1.setTitle("Alert2", for: .normal)
        uiButton1.setTitleColor(.black, for: .normal)
        uiButton1.translatesAutoresizingMaskIntoConstraints = false
        uiButton1.addAction(UIAction(handler: {_ in
            print(self.massage)
        }), for: .touchUpInside)
        NSLayoutConstraint.activate([uiButton1.centerYAnchor.constraint(equalTo: view.centerYAnchor), uiButton1.leadingAnchor.constraint(equalTo: view.centerXAnchor), uiButton1.trailingAnchor.constraint(equalTo: view.trailingAnchor), uiButton1.heightAnchor.constraint(equalToConstant: 30)])
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
