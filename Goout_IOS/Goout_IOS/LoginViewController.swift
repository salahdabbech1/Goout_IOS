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
    var thekid = kid()
    var login = LoginViewModel()
    let signInConfig = GIDConfiguration.init(clientID: "916408359674-444aoaf8o8mjg69ujus6io0kadlcoeht.apps.googleusercontent.com")
    let googleLoginButton = GIDSignInButton()
    @IBOutlet weak var emailtext: UITextField!
    @IBOutlet weak var passwordtext: UITextField!
    @IBOutlet weak var googleStakView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        googleStakView.addSubview(googleLoginButton)
        googleLoginButton.addTarget(self, action: #selector(googleSignIn), for: .touchUpInside)
        print("hani lena loadit")
        
        // Do any additional setup after loading the view.
    }
    func makeAlert(titre: String?, message: String?) {
        let alert = UIAlertController(title: titre, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    
    
    
    @IBAction func Signin(_ sender: Any) {
        
        login.SigninParent(Email: emailtext.text!, Password: passwordtext.text!) {(success, reponse) in
            if success {
                self.theparent = reponse as! Parent
                self.performSegue(withIdentifier: "ParentsigninSegue", sender: nil)
            } else {
                let alert = UIAlertController(title: "error", message: "error occured", preferredStyle: .alert)
                let action = UIAlertAction(title: "retry", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true)
            }
        }
    }
    @IBAction func Signinkid(_ sender: Any) {
        
        KidloginViewModel().SigninKid(Email: emailtext.text!, Password: passwordtext.text!) { (success, reponse) in
            if success {
                self.thekid = reponse as! kid
                self.performSegue(withIdentifier: "KidsigninSegue", sender: nil)
            } else {
                let alert = UIAlertController(title: "error", message: "error occured", preferredStyle: .alert)
                let action = UIAlertAction(title: "retry", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true)
            }
        }
    }
    
    @objc func googleSignIn() {
        
        
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { [self] user, error in
            guard error == nil else { return }
            guard let user = user else { return }
            
            let email = user.profile?.email
            let name = (user.profile?.givenName)! + " " + (user.profile?.familyName)!
            
            loginWithSocialMedia(email: email, name: name, socialMediaName: "Google")
        }
    }
    func loginWithSocialMedia(email: String?, name: String?,
                              socialMediaName: String) {
        
        LoginViewModel().loginWithSocialApp( Email :email! , Name :name!, completed: { success, user in
            if success {
                self.performSegue(withIdentifier: "ParentsigninSegue", sender: nil)
            } else {
                print("probleme here")
                
            }
            
        })
    }
    
}

