//
//  ViewController.swift
//  ElectricCar
//
//  Created by Tardes on 13/1/25.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func createUser(_ sender: Any) {
        Auth.auth().createUser(withEmail: usernameTextField.text!, password: passwordTextField.text!) { authResult, error in
            if let error = error {
                print(error)
                
                let alertController = UIAlertController(title: "Create user", message: error.localizedDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alertController, animated: true, completion: nil)
                
            } else {
                print("user signs up succeddfuly")
                
                let alertController = UIAlertController(title: "Create user", message: "user signs up succeddfuly", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func SignIn(_ sender: Any) {
        Auth.auth().signIn(withEmail: usernameTextField.text!, password: passwordTextField.text!) { [weak self] authResult, error in
            if let error = error {
                
                let alertController = UIAlertController(title: "Sign in", message: error.localizedDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))
                self!.present(alertController, animated: true, completion: nil)
            } else {
                let alertController = UIAlertController(title: "Sign in", message: "Sign In", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))
                self!.present(alertController, animated: true, completion: nil)
                
                self?.performSegue(withIdentifier: "goToHome", sender: nil)
            }
        }
    }
}

