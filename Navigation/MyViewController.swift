//
//  MyViewController.swift
//  Navigation
//
//  Created by Dmitry Gorbunow on 12/11/22.
//

import UIKit

import UIKit

class ViewController: UIViewController {

    var firstName: UITextField!
    var lastName: UITextField!
    var email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func addGuest(_ sender: Any) {
        displayForm(message: "Please enter guest information")
    }
    
    func displayForm(message:String){
        //create alert
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        
        //create cancel button
        let cancelAction = UIAlertAction(title: "Cancel" , style: .cancel)
        
        //create save button
        let saveAction = UIAlertAction(title: "Submit", style: .default) { (action) -> Void in
            
           //validation logic goes here
        }
        
        //add button to alert
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        
        //create first name textfield
        alert.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "Type first name here..."
            self.firstName = textField
        })
        
        //create last name textfield
        alert.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "Type last name here..."
            self.lastName = textField
        })
        
        //create email field
        alert.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "Type email here..."
            self.email = textField
        })
        
        self.present(alert, animated: true, completion: nil)
    }
}
