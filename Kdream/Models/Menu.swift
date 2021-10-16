//
//  Menu.swift
//  Kdream
//
//  Created by Admin on 11.08.2021.
//

import Foundation
import UIKit

struct Category:Decodable{
    var name: String?
}
struct GroupProduct{
    var name: String
    var products: [Product]
}
struct Product{
    var productId: Int
    var name: String
    var image: UIImage
    var price: Float
}
class Menu{
    init(){
        setup()
    }
    var groups = [GroupProduct]()
    func setup(){
        /*let urlGetCategoryInJson = "https://kdream.ru/Categories/GetCategoryInJson"
        guard let url = URL(string: urlGetCategoryInJson) else {
            return
        }
        URLSession.shared.dataTask(with: url)  {(data, responce, error) in
            guard let data = data else{return}
            guard error == nil else{return}
            
            do{
                let mymass = try JSONDecoder().decode(Category.self, from: data)
                print(mymass)
            }
            catch{
                print("error")
            }
            
        }*/
        
        
        let p1 = Product(productId: 1, name: "Именной держатель 1", image: UIImage(named: "cartoon")!, price: 350.0)
        let p2 = Product(productId: 1, name: "Именной держатель 2", image: UIImage(named: "category1")!, price: 330.0)
        let p3 = Product(productId: 1, name: "Именной держатель 3", image: UIImage(named: "category1")!, price: 300.0)
        
        let p4 = Product(productId: 1, name: "Пеленка 1", image: UIImage(named: "cartoon")!, price: 350.0)
        let p5 = Product(productId: 1, name: "Пеленка 2", image: UIImage(named: "category1")!, price: 330.0)
        let p6 = Product(productId: 1, name: "Пеленка 3", image: UIImage(named: "category1")!, price: 300.0)
        
        let products1 = [p1, p2, p3]
        let products2 = [p5, p4, p6]
    
        let g1 = GroupProduct(name: "первая", products: products1)
        let g2 = GroupProduct(name: "вторая", products: products2)
        let g3 = GroupProduct(name: "третья", products: products1)
        let g4 = GroupProduct(name: "четвертая", products: products2)
        
        self.groups = [g1, g2, g3, g4]
 
    }
}
extension String {
    func widthOfSrting(usingFont font: UIFont) -> CGFloat{
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = (self as NSString).size(withAttributes: fontAttributes)
        return ceil(size.width)
    }
}
