//
//  KidsViewModelViewController.swift
//  Goout_IOS
//
//  Created by SalahDabbech on 14/12/2021.
//

import UIKit
import SwiftyJSON
import Alamofire
class KidsViewModelViewController: UIViewController {
    func GetKids(completed: @escaping (Bool, [kid]?) -> Void){
        AF.request("http://localhost:3000/Parent/RegisterParent",method: .get)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
