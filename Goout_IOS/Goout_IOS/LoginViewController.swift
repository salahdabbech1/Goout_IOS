//
//  LoginViewController.swift
//  Goout_IOS
//
//  Created by Salah_4sim2 on 25/11/2021.
//

import UIKit


//var

//iboutlet

class LoginViewController: UIViewController {
    var theparent = Parent()
    var thekid = kid()
    var login = LoginViewModel()
 
    @IBOutlet weak var emailtext: UITextField!
    @IBOutlet weak var passwordtext: UITextField!
    @IBOutlet weak var googleStakView: UIStackView!
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

