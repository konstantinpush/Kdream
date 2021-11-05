//
//  ProductInfoRouter.swift
//  Kdream
//
//  Created by Kasatin on 04.11.2021.
//

import Foundation

import UIKit

class ProductInfoRouter: ProductInfoRouterProtocol{
    func closeCurrentViewController() {
        //
    }


    weak var viewController: ProductInfoViewController!

    init(viewController: ProductInfoViewController){
        self.viewController = viewController
    }

//    func showProductInfo() {
//        viewController.performSegue(withIdentifier: viewController.selfToAboutSegueName, sender: nil)
//    }

    func openProductInfoPage() {
//        viewController.performSegue(withIdentifier: viewController.selfToAboutSegueName, sender: nil)
    }

    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "goToProduct"{
//            let vc = segue.destination as! ProductInfoViewController
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
//        }
    }



}
