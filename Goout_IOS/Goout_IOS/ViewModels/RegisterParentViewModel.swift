//
//  RegisterParentViewController.swift
//  Goout_IOS
//
//  Created by Salah_4sim2 on 26/11/2021.
//

import UIKit
import Alamofire
class RegisterParentViewController: UIViewController {
    func RegisterParent(Parent: Parent, completed: @escaping (Bool) -> Void) {
        AF.request("http://localhost:3000/api/Parent/RegisterParent",
                   method: .post,
                   parameters: [
                    "Name": Parent.Name!,
                    "Last_Name": Parent.Last_Name!,
                    "Email": Parent.Email!,
                    "Password": Parent.Password!,
                    "Picture": Parent.Picture
                   ])
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
