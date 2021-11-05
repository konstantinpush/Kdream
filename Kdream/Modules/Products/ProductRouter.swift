//
//  ProductRouter.swift
//  Kdream
//
//  Created by Kasatin on 03.11.2021.
//

import Foundation
import UIKit

class ProductRouter: ProductRouterProtocol{

    weak var viewController: ProductViewController!

    init(viewController: ProductViewController){
        self.viewController = viewController
    }

//    func showProductInfo() {
//        viewController.performSegue(withIdentifier: viewController.selfToAboutSegueName, sender: nil)
//    }

    func openProductInfoPage() {
        viewController.performSegue(withIdentifier: viewController.selfToAboutSegueName, sender: "11")
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToProduct"{
            
            let vc = segue.destination as! ProductInfoViewController
//            vc.product = sender as! Product
//            print(vc.product.name)
//            print(sender)
//            let indexPath = sender as! IndexPath
//            let product: Product!
//
//            if self.viewController.searchController.isActive{
//                product =  self.viewController.filteredProducts[indexPath.row]
//            }
//            else{
//                product = self.viewController.productsFromServer[indexPath.row]
//            }
//            vc.product = product
        }
    }



}


