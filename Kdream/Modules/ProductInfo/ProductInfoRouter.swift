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

    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }



}
