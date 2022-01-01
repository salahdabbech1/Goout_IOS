//
//  PassforgetViewController.swift
//  Goout_IOS
//
//  Created by SalahDabbech on 30/12/2021.
//

import UIKit

class PassforgetViewController: UIViewController {
    
    // VAR
    struct MotDePasseOublieData {
        var email: String?
        var code: String?
    }
    
    var data : MotDePasseOublieData?
    
    //WIDGET
    
    @IBOutlet weak var emailtext: UITextField!
    
    
   
    // LIFECYCLE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "confirmationSegue"{
        let destination = segue.destination as! ConfirmationViewController
        destination.data = data
        }
    }

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
    
    @IBAction func next(_ sender: Any) {
        
        if (emailtext.text!.isEmpty){
            //self.present(Alert.makeAlert(titre: "Avertissement", message: "Veuillez taper votre email"), animated: true)
            print ("email is empty")
            return
        }
        
      
        
        data = MotDePasseOublieData(email: emailtext.text, code: String(Int.random(in: 100000..<999999)))
        print(data!)
        
        LoginViewModel().motDePasseOublie(Email: (data?.email)!, codeDeReinit: (data?.code)! ) { success in
            if success {
                self.performSegue(withIdentifier: "confirmationSegue", sender: self.data)
            } else {
                let alert = UIAlertController(title: "Non existant", message: "this email doesnt exist", preferredStyle: .alert)
                 let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                 alert.addAction(action)
                 self.present(alert, animated: true)            }
        }
    }
        
    }
    



