//
//  ItemForRedactor.swift
//  Kdream
//
//  Created by Admin on 26.09.2021.
//

import Foundation
import UIKit

enum Type{
    case category
    case product
}
class ItemForRedactor: NSObject{
    var Icon: UIImage
    var Name: String
    init(Icon: UIImage, Name: String){
        self.Icon = Icon
        self.Name = Name
    }
}


/*struct Category{
    var CategoryId: Int
    var Name: String
    var IsSwitch: Bool
    var Photo: UIImage
    var Description: String
    
}
struct Product{
    var Name: String
    var CategoryId: Int
    var Photo: UIImage
    var Description: String
    var Price: Double
}*/
