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
    func SigninParent(Email: String, Password: String, completed: @escaping (Bool, Any?) -> Void) {
        AF.request("http://localhost:3000/Parent/Loginparent",
                   method: .post,
                   parameters: ["Email": Email, "Password": Password], encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    let jsonData = JSON(response.data!)
                    print(jsonData)
                    let parent = self.makeItem(jsonItem: jsonData["Parent"])
                   
                    UserDefaults.standard.setValue(jsonData["token"].stringValue, forKey: "tokenConnexion")
                    UserDefaults.standard.setValue(parent._id, forKey: "id")
                    UserDefaults.standard.setValue(parent.Role, forKey: "parentRole")
                    completed(true, parent)
                    print(parent)
                case let .failure(error):
                    debugPrint(error)
                    completed(false, "non")
                }
               
            };
        
    }
    func loginWithSocialApp(Email: String, Name: String, completed: @escaping (Bool, Parent?) -> Void ) {
            AF.request("http://localhost:3000/Parent/LoginwithSocial",
                       method: .post,
                       parameters: ["Email": Email, "Name": Name],
                       encoding: JSONEncoding.default)
                .validate(statusCode: 200..<300)
                .validate(contentType: ["application/json"])
                .response { response in
                    switch response.result {
                    case .success:
                        let jsonData = JSON(response.data!)
                        
                        let parent = self.makeItem(jsonItem: jsonData["parent"])
                        print("this is the new token value : " + jsonData["token"].stringValue)
                        UserDefaults.standard.setValue(jsonData["token"].stringValue, forKey: "tokenConnexion")
                        UserDefaults.standard.setValue(parent._id, forKey: "id")
                        completed(true, parent)
                    case let .failure(error):
                        debugPrint(error)
                        completed(false, nil)
                    }
                }
        }
    func motDePasseOublie(Email: String, codeDeReinit: String, completed: @escaping (Bool) -> Void) {
        AF.request("http://localhost:3000/Parent/passforget",
                   method: .post,
                   parameters: ["Email": Email, "codeDeReinit": codeDeReinit],
                   encoding: JSONEncoding.default)
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
    
    func changerMotDePasse(email: String, nouveauMotDePasse: String, completed: @escaping (Bool) -> Void) {
        AF.request( "http://localhost:3000/Parent/changepass",
                   method: .put,
                   parameters: ["Email": email,"nouveauMotDePasse": nouveauMotDePasse])
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
    func makeItem(jsonItem: JSON) -> Parent {
        var Kids: [kid] = []
                for i in jsonItem["Kids"] {
                    Kids.append(makekid(jsonItem: i.1))
                    
                }
        return Parent(
            _id: jsonItem["_id"].stringValue,
            Name: jsonItem["Name"].stringValue,
            Email: jsonItem["Email"].stringValue,
            Password: jsonItem["Password"].stringValue,
            Picture: jsonItem["Picture"].stringValue,
            Role: jsonItem["Role"].stringValue,
            Kids: Kids
        )
        
        }
    func makekid(jsonItem: JSON) -> kid {
        kid(
            _id: jsonItem["_id"].stringValue
        )
    }
}
