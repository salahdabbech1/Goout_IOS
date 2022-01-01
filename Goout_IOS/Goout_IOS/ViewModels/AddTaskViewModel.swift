//
//  AddTaskViewModel.swift
//  Goout_IOS
//
//  Created by SalahDabbech on 31/12/2021.
//

import UIKit
import Alamofire
import SwiftyJSON
class AddTaskViewModel: UIViewController {
    func addTask(Task: task,Kidid:String?, completed: @escaping (Bool) -> Void) {
        AF.request("http://localhost:3000/Parent/"+Kidid!+"/addtask",
                   method: .post,
                   parameters: [
                    "Name": Task.Name!,
                    "Description": Task.Description!
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
