//
//  ProductInfoInteractor.swift
//  Kdream
//
//  Created by Kasatin on 04.11.2021.
//

import Foundation

class ProductInfoInteractor: ProductInfoInteractorProtocol {
    func getImageOfProduct() {
//        product.getImage{ [weak self] image, name in
//            print(self?.image)
//        }
    }


    weak var presenter: ProductInfoPresenterProtocol!
//    let serverService: ServerServiceProtocol = ServerService()

    required init(presenter: ProductInfoPresenterProtocol) {
        self.presenter = presenter
    }

    var product: Product {
        get {
            return product
        }
    }
}
