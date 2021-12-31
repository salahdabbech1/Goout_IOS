//
//  TasklistViewModel.swift
//  Goout_IOS
//
//  Created by SalahDabbech on 31/12/2021.
//

import UIKit
import Alamofire
import SwiftyJSON
class TasklistViewModel: UIViewController {
    func GetTasks(Kidid:String?,completed: @escaping (Bool, [task]?) -> Void){
        AF.request("http://localhost:3000/Parent/"+Kidid!+"/gettasks",method: .get)
                 .validate(statusCode: 200..<300)
                             .validate(contentType: ["application/json"])
                             .responseData { response in
                                 switch response.result {
                                 case .success:
                                     let jsonData = JSON(response.data!)
                                     var Tasks : [task]? = []
                                     for singleJsonItem in jsonData["Tasks"] {
                                         Tasks!.append(self.makeItem(jsonItem: singleJsonItem.1))
                                     }
                                     
                                     completed(true, Tasks)
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
    
    func makeItem(jsonItem: JSON) -> task {
            
            return task(
                _id: jsonItem["_id"].stringValue,
                Name: jsonItem["Name"].stringValue,
                Description: jsonItem["Description"].stringValue
            )
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
