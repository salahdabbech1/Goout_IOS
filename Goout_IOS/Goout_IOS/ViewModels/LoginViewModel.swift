//
//  LoginViewModel.swift
//  Goout_IOS
//
//  Created by Salah_4sim2 on 26/11/2021.
//

import UIKit
import SwiftyJSON
import Alamofire
import UIKit.UIImage
import Darwin
import CloudKit

class LoginViewModel: ObservableObject{
    
    
    
    func Signin(Email: String, Password: String, completed: @escaping (Bool, Any?) -> Void) {
        AF.request("http://localhost:3000/Parent/Login",
                   method: .post,
                   parameters: ["Email": Email, "Password": Password], encoding: JSONEncoding.default)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    let jsonData = JSON(response.data!)
                    let parent = self.makeItem(jsonItem: jsonData["Parent"])
                    UserDefaults.standard.setValue(jsonData["token"].stringValue, forKey: "tokenConnexion")
                    UserDefaults.standard.setValue(parent._id, forKey: "idParent")
                    print(parent)
                    completed(true, parent)
                case let .failure(error):
                    debugPrint(error)
                    completed(false, nil)
                }
            }; print(UserDefaults.standard)
    }
    
    func makeItem(jsonItem: JSON) -> Parent {
        var Kids: [kid] = []
                for i in jsonItem["Kids"] {
                    Kids.append(makekid(jsonItem: i.1))
                }
        return Parent(
            _id: jsonItem["_id"].stringValue,
            Name: jsonItem["Name"].stringValue,
            Last_Name: jsonItem["Last_Name"].stringValue,
            Email: jsonItem["Email"].stringValue,
            Password: jsonItem["Password"].stringValue,
            Picture: jsonItem["Picture"].stringValue,
            Role: jsonItem["role"].stringValue,
            Kids: Kids
        )
        
        }
    func makekid(jsonItem: JSON) -> kid {
        kid(
            _id: jsonItem["_id"].stringValue
        )
    }
}
