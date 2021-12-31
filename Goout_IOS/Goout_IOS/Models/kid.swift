//
//  Kids.swift
//  Goout_IOS
//
//  Created by Mac2021 on 29/11/2021.
//

import Foundation
struct kid:  Encodable {
    internal init(_id: String? = nil, Name: String? = nil, Email: String? = nil, Password: String? = nil, Tasks: [task]? = nil) {
        self._id = _id
        self.Name = Name
        self.Email = Email
        self.Password = Password
        self.Tasks = Tasks
    }
    
    

    var _id : String?
    var Name : String?
    var Email  : String?
    var Password : String?
    var Tasks : [task]?
}
