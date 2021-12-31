//
//  RegisterKidViewModel.swift
//  Goout_IOS
//
//  Created by Salah_4sim2 on 26/11/2021.
//

import UIKit
import Alamofire
class RegisterKidViewModel: UIViewController {
    func RegisterKid(Kid: kid, completed: @escaping (Bool) -> Void) {
        AF.request("http://localhost:3000/Parent/"+UserDefaults.standard.string(forKey: "idParent")!+"/RegisterKids",
                   method: .post,
                   parameters: [
                    "Name": Kid.Name!,
                    "Email": Kid.Email!,
                    "Password": Kid.Password!,
                   ],encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    completed(true)
                case let .failure(error):
                    print(error)
                    completed(false)
                }
            }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
