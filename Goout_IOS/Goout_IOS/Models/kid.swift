//
//  Kids.swift
//  Goout_IOS
//
//  Created by Mac2021 on 29/11/2021.
//

import Foundation
struct kid:  Hashable, Codable {
    internal init(_id: String? = nil, Name: String? = nil, Email: String? = nil, Password: String? = nil) {
        self._id = _id
        self.Name = Name
        self.Email = Email
        self.Password = Password
    }
    

    var _id : String?
    var Name : String?
   
    var Email  : String?
    var Password : String?
}
