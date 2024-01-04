//
//  ContactID.swift
//  ios-contact-manager-ui_Hong
//
//  Created by yujaehong on 1/2/24.
//

import UIKit

struct ContactID{
    var name: String?
    var age: Int?
    var phoneNumber: String?
    
    init(name: String? = nil, age: Int? = nil, phoneNumber: String? = nil) {
        self.name = name
        self.age = age
        self.phoneNumber = phoneNumber
    }
}



