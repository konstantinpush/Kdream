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
        
        
        let prod1 = Product(productId: 1, name: "держатель1", urlImage: "https://cs11.livemaster.ru/storage/topicavatar/600x450/e3/9e/1db9e75e655eb2de40c49a8a77f83027ca7c1y.jpg?h=ks_W8aNWYnNAZJaASIrlsQ", price: 100.0)
        let prod2 = Product(productId: 2, name: "держатель2", urlImage: "https://shop-cdn1.vigbo.tech/shops/32990/products/20222117/images/3-afcd26f1946aee1e679592a4adbb755d.jpg", price: 200.0)
        let prod3 = Product(productId: 3, name: "держатель3", urlImage: "https://odmdetka.ru/upload/iblock/c82/IMG_20200928_191852_702.jpg", price: 300.0)
        let prod4 = Product(productId: 4, name: "держатель4", urlImage: "https://shop-cdn1.vigbo.tech/shops/32990/products/20182640/images/3-aa4663e508785261dd9e2bfc9bd1127f.jpg", price: 400.0)
        let prod5 = Product(productId: 5, name: "держатель5", urlImage: "https://static-sl.insales.ru/r/KF493i5zYkw/fit/1200/1200/ce/1/plain/images/products/1/7476/327056692/D7CBDB4A-B275-43D3-A747-8DB78DE19944.jpeg", price: 500.0)
        let prod6 = Product(productId: 6, name: "держатель6", urlImage: "https://www.hobbyportal.ru/data/products/cache/2019oct/21/53/322777_10385.jpg", price: 600.0)
        
        let products1 = [prod1, prod2, prod3]
        let products2 = [prod5, prod4, prod6]
    
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
