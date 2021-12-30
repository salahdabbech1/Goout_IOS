//
//  ConfirmationViewController.swift
//  Goout_IOS
//
//  Created by SalahDabbech on 30/12/2021.
//

import UIKit

class ConfirmationViewController: UIViewController {
    var data : PassforgetViewController.MotDePasseOublieData?
    var compteur: Int?
    var compteurTimer : Timer?
    
    //WIDGET
    
    @IBOutlet weak var code: UITextField!
    
    @IBOutlet weak var confirmationnext: UIButton!
    @IBOutlet weak var compteurLabel: UILabel!
    //PROTOCLE
    // LIFECYCLE

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        compteurLabel.text = "60"
        compteur = 60
        startTimer()

    
    }
    override func viewDidDisappear(_ animated: Bool) {
        stopTimer()
    }
    
    // METHODS
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
    
    @objc func update()  {
        if (compteur! > 0){
            compteur! -= 1
            compteurLabel.text = String(compteur!)
        } else {
            stopTimer()
            confirmationnext.isEnabled = false
            code.isUserInteractionEnabled = false
            compteurLabel.textColor = .darkGray
            //self.present(Alert.makeAlert(titre: "Avertissement", message: "Le code a exprié veuillez recommencer"), animated: true)
        }
        
        
        //Action
        
    }
    @IBAction func nextconfirmation(_ sender: Any) {
        if (code.text!.isEmpty){
            //self.present(Alert.makeAlert(titre: "Avertissement", message: "Veuillez taper le code"), animated: true)
            return
        }
        
        if (code.text == data?.code ) {
            self.performSegue(withIdentifier: "changerMdpSegue", sender: data?.email)
        } else {
            //self.present(Alert.makeAlert(titre: "Erreur", message: "Code incorrect"), animated: true)
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




