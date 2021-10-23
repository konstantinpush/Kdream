//
//  Menu.swift
//  Kdream
//
//  Created by Admin on 11.08.2021.
//

import Foundation
import UIKit


//struct GroupProduct{
//    var name: String
//    var products: [Product]
//}

class Menu{
    var groups = [Category]()
    
    init(){
//        var infoServer = InfoFromServerService()
        //InfoFromServerService.getProductsFromServer { products in
//        self.groups = infoServer.categories
         }
    }

extension String {
    func widthOfSrting(usingFont font: UIFont) -> CGFloat{
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = (self as NSString).size(withAttributes: fontAttributes)
        return ceil(size.width)
    }
}
