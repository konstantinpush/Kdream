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

    func openProductInfoPage() {
        viewController.performSegue(withIdentifier: viewController.selfToAboutSegueName, sender: "11")
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {

//        self.viewController?.navigationController?.pushViewController(ProductInfoViewController!, animated: true)


//        if segue.identifier == "goToProduct"{
//            let vc = segue.destination as! ProductInfoViewController
//            vc.presenter.interactor.product = sender as! Product
//        }
    }
}
