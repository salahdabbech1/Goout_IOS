//
//  Parent.swift
//  Goout_IOS
//
//  Created by Mac2021 on 29/11/2021.
//

import Foundation

struct Parent: Encodable {
    internal init(_id: String? = nil, Name: String? = nil, Last_Name: String? = nil, Email: String? = nil, Password: String? = nil, Picture: String? = nil, Role: String? = nil, Kids: [kid]? = nil) {
        self._id = _id
        self.Name = Name
        self.Last_Name = Last_Name
        self.Email = Email
        self.Password = Password
        self.Picture = Picture
        self.Role = Role
        self.Kids = Kids
    }
    
    
    var _id : String?
    var Name : String?
    var Last_Name : String?
    var Email  : String?
    var Password : String?
    var Picture : String?
    var Role: String?
    var Kids:[kid]?
    
    
}
