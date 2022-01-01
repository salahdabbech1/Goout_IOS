//
//  KidloginViewModel.swift
//  Goout_IOS
//
//  Created by SalahDabbech on 31/12/2021.
//

import UIKit
import Alamofire
import SwiftyJSON
class KidloginViewModel: ObservableObject {
    func SigninKid(Email: String, Password: String, completed: @escaping (Bool, Any?) -> Void) {
        AF.request("http://localhost:3000/Parent/Loginkid",
                   method: .post,
                   parameters: ["Email": Email, "Password": Password], encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    let jsonData = JSON(response.data!)
                    print(jsonData)
                    let kid = self.makeItem(jsonItem: jsonData["Kid"])
                    UserDefaults.standard.setValue(jsonData["token"].stringValue, forKey: "tokenConnexion")
                    UserDefaults.standard.setValue(kid._id, forKey: "id")
                    completed(true, kid)
                case let .failure(error):
                    debugPrint(error)
                    completed(false, "non")
                }
               
            }}
        
        

          
    func makeItem(jsonItem: JSON) -> kid {
        var tasks: [task] = []
                for i in jsonItem["Tasks"] {
                    tasks.append(maketask(jsonItem: i.1))
                    
                }
        return kid(
            _id: jsonItem["_id"].stringValue,
            Name: jsonItem["Name"].stringValue,
            Email: jsonItem["Email"].stringValue,
            Password: jsonItem["Password"].stringValue,
            Tasks: tasks
        )
        
        }
    func maketask(jsonItem: JSON) -> task {
        task(
            _id: jsonItem["_id"].stringValue
        )
    }

        

}
