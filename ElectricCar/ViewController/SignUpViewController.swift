//
//  SignUpViewController.swift
//  ElectricCar
//
//  Created by Tardes on 16/1/25.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createUser(_ sender: Any) {
        Auth.auth().createUser(withEmail: usernameTextField.text!, password: passwordTextField.text!) { authResult, error in
            if let error = error {
                print(error)
                
                let alertController = UIAlertController(title: "Create user", message: error.localizedDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alertController, animated: true, completion: nil)
                
            } else {
                print("Create user successfuly")
                
                let alertController = UIAlertController(title: "Error User", message: "Create user successfuly", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }

}
