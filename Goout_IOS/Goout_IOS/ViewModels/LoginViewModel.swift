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
    func RegisterParent(Parent: Parent, completed: @escaping (Bool) -> Void) {
        AF.request("http://localhost:3000/Parent/RegisterParent",
                   method: .post,
                   parameters: [
                    "Name": Parent.Name!,
                    "Last_Name": Parent.Last_Name!,
                    "Email": Parent.Email!,
                    "Password": Parent.Password!,
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
    
    
    func Signin(email: String, mdp: String, completed: @escaping (Bool, Any?) -> Void) {
        AF.request("http://localhost:3000/Parent/Signin",
                   method: .post,
                   parameters: ["email": email, "mdp": mdp])
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    let jsonData = JSON(response.data!)
                    let parent = self.makeItem(jsonItem: jsonData["utilisateur"])
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
        //let isoDate = jsonItem["dateNaissance"]
        let isoDate = "2016-04-14T10:44:00+0000"
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from:isoDate)!
        
        /*return Parent(
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
        )*/
    }
}

