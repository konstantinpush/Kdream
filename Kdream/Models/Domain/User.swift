//
//  User.swift
//  Kdream
//
//  Created by Admin on 26.09.2021.
//

import Foundation
import UIKit

class User:Decodable{
    var id: String
    var name: String
    var email: String
    var phone: String
    var role:String
    var image: String

    func getImage(_ completion: @escaping ((UIImage, String) -> Void)) {
        DispatchQueue.global().async {
            PhotoService.loadPhotoFromUrl(_url: self.image) { image in
                    DispatchQueue.main.async {
                        completion(image, self.name)
                    }
                }
        }
    }

    init(id: String, phone: String, image:String, email:String, name: String, role: String){
        self.id = id
        self.name = name
        self.image = image
        self.email = email
        self.phone = phone
        self.role = role
    }
}
