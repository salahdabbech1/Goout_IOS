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

class LoginViewModel: ObservableObject{
    
    
    
    func Signin(Email: String, Password: String, completed: @escaping (Bool, Any?) -> Void) {
        AF.request("http://localhost:3000/Parent/Signin",
                   method: .post,
                   parameters: ["Email": Email, "Password": Password])
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    let jsonData = JSON(response.data!)
                    let parent = self.makeItem(jsonItem: jsonData["Parent"])
                    UserDefaults.standard.setValue(jsonData["token"].stringValue, forKey: "tokenConnexion")
                    print(parent)
                    
                    completed(true, parent)
                case let .failure(error):
                    debugPrint(error)
                    completed(false, nil)
                }
            }
    }
    
    func makeItem(jsonItem: JSON) -> Parent {
    /*      return Parent(
            _id: jsonItem["_id"].stringValue,
            pseudo: jsonItem["pseudo"].stringValue,
            email: jsonItem["email"].stringValue,
            mdp: jsonItem["mdp"].stringValue,
            nom: jsonItem["nom"].stringValue,
            prenom: jsonItem["prenom"].stringValue,
            dateNaissance: date,
            idPhoto: jsonItem["idPhoto"].stringValue,
            sexe: jsonItem["sexe"].boolValue,
            score: jsonItem["score"].intValue,
            bio: jsonItem["bio"].stringValue,
            isVerified: jsonItem["isVerified"].boolValue
        )
    }*/
}

