//
//  Product.swift
//  Kdream
//
//  Created by Kasatin on 17.10.2021.
//

import Foundation
import UIKit

struct Product: Decodable{
    var name: String
    var description: String?
    var tth: String?
    var mainphoto: String
    var urlword: String
    var price: Decimal

    func getImage(_ completion: @escaping ((UIImage, String) -> Void)) {
        DispatchQueue.global().async {
                PhotoService.loadPhotoFromUrl(_url: "https://kdream.ru"+mainphoto) { image in
                    DispatchQueue.main.async {
                        completion(image, name)
                    }
                }
        }
    }

    init(name: String, description: String, tth: String,  mainphoto: String, urlword: String, price: Decimal){
        self.name = name
        self.mainphoto = mainphoto
        self.price = price
        self.description = description
        self.tth = tth
        self.urlword = urlword
    }
    }

