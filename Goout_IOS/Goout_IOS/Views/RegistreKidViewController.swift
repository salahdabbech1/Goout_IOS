//
//  RegistreKidViewController.swift
//  Goout_IOS
//
//  Created by Salah_4sim2 on 25/11/2021.
//

import UIKit

class RegistreKidViewController: UIViewController {
    var registerVM = RegisterKidViewModel()
    var thekid = kid()
    @IBOutlet weak var nametext: UITextField!
    @IBOutlet weak var emailtext: UITextField!
    @IBOutlet weak var passtext: UITextField!
    @IBOutlet weak var confirmtext: UITextField!
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
    @IBAction func add(_ sender: Any) {
        thekid.Name = nametext.text
        thekid.Email = emailtext.text
        thekid.Password = passtext.text
        registerVM.RegisterKid(Kid: thekid) { success in
            if success {    let alert = UIAlertController(title: "Succes", message: "account created", preferredStyle: .alert)
                            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                            alert.addAction(action)
                           self.present(alert, animated: true)
                            
                       } else {
                           print("probleme at kid")
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
