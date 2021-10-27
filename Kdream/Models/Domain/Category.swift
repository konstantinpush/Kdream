//
//  Category.swift
//  Kdream
//
//  Created by Kasatin on 20.10.2021.
//

import Foundation
import UIKit

struct Category:Decodable{
    var name: String?
    var description: String?
    var image: String?
    var photoInApp: UIImage{
        PhotoService.loadPhotoFromUrl(_url: image ?? "img-user")
    }
    var products: [Product]
    
    init(name: String, description: String, image: String, products: [Product]){
        self.name = name
        self.image = image
        self.description = description
        self.products = products
    }
}

