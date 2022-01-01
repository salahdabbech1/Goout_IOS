//
//  ConfirmationViewController.swift
//  Goout_IOS
//
//  Created by SalahDabbech on 1/1/2022.
//

import UIKit

class ConfirmationViewController: UIViewController {
    var data : PassforgetViewController.MotDePasseOublieData?
    var compteur: Int?
    var compteurTimer : Timer?
    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var compteurExpirationLabel: UILabel!
    @IBOutlet weak var buttonSend: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        compteurExpirationLabel.text = "60"
        compteur = 60
        startTimer()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ChangePassViewController
        destination.email = data?.email
    }
    
    func startTimer () {
        guard compteurTimer == nil else { return }
        
        compteurTimer =  Timer.scheduledTimer(
            timeInterval: 1,
            target      : self,
            selector    : #selector(update),
            userInfo    : nil,
            repeats     : true)
    }
    
    func stopTimer() {
        compteurTimer?.invalidate()
        compteurTimer = nil
    }

    @objc
    func update()  {
        if (compteur! > 0){
            compteur! -= 1
            compteurExpirationLabel.text = String(compteur!)
        } else {
            stopTimer()
            buttonSend.isEnabled = false
            codeTextField.isUserInteractionEnabled = false
            compteurExpirationLabel.textColor = .darkGray
           let alert = UIAlertController(title: "time out", message: "error", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true)
        }
    }

    @IBAction func next(_ sender: Any) {
        if (codeTextField.text!.isEmpty){
            let alert = UIAlertController(title: "Code", message: "please insert code", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true)
        }
        
        if (codeTextField.text == data?.code ) {
            self.performSegue(withIdentifier: "changerMdpSegue", sender: data?.email)
        } else {
            let alert = UIAlertController(title: "Code", message: "Wrong code", preferredStyle: .alert)
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


