//
//  RegistreParentViewController.swift
//  Goout_IOS
//
//  Created by Salah_4sim2 on 25/11/2021.
//

import UIKit
import Foundation
class RegistreParentViewController: UIViewController {
    //var
    var theparent = Parent()
    var registerviewmodel = RegisterParentViewModel()
    //Iboutlet
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lastnameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var confirmField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    //methods
    func makeAlert(titre: String?, message: String?) {
           let alert = UIAlertController(title: titre, message: message, preferredStyle: .alert)
           let action = UIAlertAction(title: "OK", style: .default, handler: nil)
           alert.addAction(action)
           self.present(alert, animated: true)
       }
    //IBfunction

    @IBAction func RegisterParent(_ sender: Any) {
        theparent.Name = nameField.text
        theparent.Last_Name = lastnameField.text
        theparent.Password = passwordField.text
        theparent.Email = emailField.text
        registerviewmodel.RegisterParent(Parent: theparent) { (success) in
            if success {
                           
                           let alert = UIAlertController(title: "Succes", message: "account created, weclome!", preferredStyle: .alert)
                           self.present(alert, animated: true)
                            
                       } else {
                           print("probleme here")
                       }
        }
        
    
}
}
