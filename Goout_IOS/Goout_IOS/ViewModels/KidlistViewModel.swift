//
//  KidsViewModelViewController.swift
//  Goout_IOS
//
//  Created by SalahDabbech on 14/12/2021.
//

import UIKit
import SwiftyJSON
import Alamofire
class KidlistViewModel: UIViewController{
   func GetKids(completed: @escaping (Bool, [kid]?) -> Void){
       AF.request("https://whispering-badlands-86315.herokuapp.com/Parent/"+UserDefaults.standard.string(forKey: "id")!+"/getkids",method: .get)
                .validate(statusCode: 200..<300)
                            .validate(contentType: ["application/json"])
                            .responseData { response in
                                switch response.result {
                                case .success:
                                    let jsonData = JSON(response.data!)
                                    var kids : [kid]? = []
                                    for singleJsonItem in jsonData["kids"] {
                                        kids!.append(self.makeItem(jsonItem: singleJsonItem.1))
                                    }
                                    
                                    completed(true, kids)
                                case let .failure(error):
                                    debugPrint(error)
                                    completed(false, nil)
                                }
                            }.resume()
                    }
        
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func makeItem(jsonItem: JSON) -> kid {
            
            return kid(
                _id: jsonItem["_id"].stringValue,
                Name: jsonItem["Name"].stringValue,
                Email: jsonItem["Email"].stringValue
            )
        }

}
