//
//  Task.swift
//  Goout_IOS
//
//  Created by SalahDabbech on 31/12/2021.
//

import Foundation
struct task: Encodable{
    internal init(_id: String? = nil, Name: String? = nil, Description: String? = nil) {
        self._id = _id
        self.Name = Name
        self.Description = Description
    }
    
    var _id : String?
    var Name : String?
    var Description : String?
    
}
