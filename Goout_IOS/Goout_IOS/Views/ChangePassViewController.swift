//
//  ChangePassViewController.swift
//  Goout_IOS
//
//  Created by SalahDabbech on 30/12/2021.
//

import UIKit

class ChangePassViewController: UIViewController {
    var email: String?
    @IBOutlet weak var newpasstext: UITextField!
    @IBOutlet weak var confirmpasstext: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func change(_ sender: Any) {
        LoginViewModel().changerMotDePasse(email: email!, nouveauMotDePasse: newpasstext.text!) { success in
            if success{
                
                let alert = UIAlertController(title: "success", message: "change password", preferredStyle: .alert)
                let action = UIAlertAction(title: "ok", style: .default) { UIAlertAction in
                    self.performSegue(withIdentifier: "changedSegue", sender: nil)
                }
                 alert.addAction(action)
                
                 self.present(alert, animated: true)
                
                
            }else{
                let alert = UIAlertController(title: "error", message: "an error occured", preferredStyle: .alert)
                 let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                 alert.addAction(action)
                 self.present(alert, animated: true)
            }
        }
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
