//
//  LoginViewController.swift
//  Goout_IOS
//
//  Created by Salah_4sim2 on 25/11/2021.
//

import UIKit
import GoogleSignIn
//var

//iboutlet

class LoginViewController: UIViewController {
        var theparent = Parent()
        var login = LoginViewModel()
    let signInConfig = GIDConfiguration.init(clientID: "916408359674-444aoaf8o8mjg69ujus6io0kadlcoeht.apps.googleusercontent.com")
    let googleLoginButton = GIDSignInButton()
    @IBOutlet weak var emailtext: UITextField!
    @IBOutlet weak var passwordtext: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func makeAlert(titre: String?, message: String?) {
           let alert = UIAlertController(title: titre, message: message, preferredStyle: .alert)
           let action = UIAlertAction(title: "OK", style: .default, handler: nil)
           alert.addAction(action)
           self.present(alert, animated: true)
       }
    @IBAction func SignIn(_ sender: Any) {
    }
    
    @IBAction func ResetPass(_ sender: Any) {
    }
    
    @IBAction func Signin(_ sender: Any) {
        login.Signin(Email: emailtext.text!, Password: passwordtext.text!) {(success, reponse) in
            if success {
                self.theparent = reponse as! Parent
                print(self.theparent)
                self.performSegue(withIdentifier: "ParentsigninSegue", sender: nil)
            } else {
                let alert = UIAlertController(title: "error", message: "error occured", preferredStyle: .alert)
                self.present(alert, animated: true)
            }
        }
    }
    
}
