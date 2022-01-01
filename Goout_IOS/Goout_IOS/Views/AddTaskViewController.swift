//
//  AddTaskViewController.swift
//  Goout_IOS
//
//  Created by Salah_4sim2 on 25/11/2021.
//

import UIKit

class AddTaskViewController: UIViewController {
    var thetask = task()
    var addtaskVM = AddTaskViewModel()
    var kididrecived: String?
    @IBOutlet weak var nametext: UITextField!
    @IBOutlet weak var desctext: UITextView!
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
    @IBAction func addtask(_ sender: Any) {
        thetask.Name = nametext.text
        thetask.Description = desctext.text
        addtaskVM.addTask(Task: thetask, Kidid: kididrecived) { success in
            if success {    let alert = UIAlertController(title: "Succes", message: "added succesfully", preferredStyle: .alert)
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
