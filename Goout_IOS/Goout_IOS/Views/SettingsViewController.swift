//
//  SettingsViewControllerViewController.swift
//  Goout_IOS
//
//  Created by SalahDabbech on 1/1/2022.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
    }
    
    @IBAction func theme(_ sender: UISwitch) {
        if sender.isOn {
            UIApplication.shared.windows.forEach { window in
                window.overrideUserInterfaceStyle = .dark
            }
        } else {
            UIApplication.shared.windows.forEach { window in
                window.overrideUserInterfaceStyle = .light
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
    @IBAction func Logout(_ sender: Any) {
        UserDefaults.standard.set("", forKey: "id")
        userActivity.self?.setValue("", forKey: "token")
        performSegue(withIdentifier: "logoutSegue", sender: nil)
    }
    
}
