//
//  User.swift
//  Kdream
//
//  Created by Admin on 26.09.2021.
//

import Foundation
import UIKit

class User:NSObject{
    var avatar: UIImage
    var name: String
    var role:String
    
    init(avatar: UIImage, name: String, role: String){
        self.avatar = avatar
        self.name = name
        self.role = role
    }
    
    static func generateUsers() -> [User]{
        let usr1 = User(avatar: UIImage(named: "cartoon")!, name: "Иванов И.И.", role: "Адинистратор" )
        let usr2 = User(avatar: UIImage(named: "category1")!, name: "Пушкин А.С.", role: "Менеджер магазина" )
        
        let users = [usr1, usr2]
        return users
    }
}

