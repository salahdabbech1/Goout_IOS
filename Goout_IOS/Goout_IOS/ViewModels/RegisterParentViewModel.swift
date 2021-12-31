//
//  RegisterParentViewController.swift
//  Goout_IOS
//
//  Created by Salah_4sim2 on 26/11/2021.
//

import UIKit
import Alamofire
class RegisterParentViewModel: UIViewController {
    func RegisterParent(Parent: Parent, completed: @escaping (Bool) -> Void) {
        AF.request("http://localhost:3000/Parent/RegisterParent",
                   method: .post,
                   parameters: [
                    "Name": Parent.Name!,
                    "Email": Parent.Email!,
                    "Password": Parent.Password!,
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
    

}
