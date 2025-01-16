//
//  ViewController.swift
//  ElectricCar
//
//  Created by Tardes on 13/1/25.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

class SignInViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignIn(_ sender: Any) {
        Auth.auth().signIn(withEmail: usernameTextField.text!, password: passwordTextField.text!) { [weak self] authResult, error in
            if let error = error {
                
                let alertController = UIAlertController(title: "Error Sign in", message: error.localizedDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))
                self!.present(alertController, animated: true, completion: nil)
            } else {
                //let alertController = UIAlertController(title: "Sign in", message: "User sign up successfuly", preferredStyle: .alert)
                //alertController.addAction(UIAlertAction(title: "OK", style: .default))
                //self!.present(alertController, animated: true, completion: nil)
                
                self?.performSegue(withIdentifier: "goToHome", sender: nil)
            }
        }
    }
    @IBAction func googleSignIn(_ sender: Any) {
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return  }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
            guard error == nil else {
                return
            }
            
            guard let user = result?.user, let idToken = user.idToken?.tokenString else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { result, error in
                guard error == nil else {
                    return
                }
                self.performSegue(withIdentifier:"goToHome", sender: nil)
            }
        }
    }
}

