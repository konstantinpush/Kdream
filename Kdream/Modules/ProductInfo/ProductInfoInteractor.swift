//
//  ProductInfoInteractor.swift
//  Kdream
//
//  Created by Kasatin on 04.11.2021.
//

import Foundation
import UIKit

class ProductInfoInteractor: ProductInfoInteractorProtocol {
    var product: Product {
        get{
            return product
        }
        set{
            product = newValue
        }
    }

    func getImageOfProduct() {
        presenter.showHUD()
        product.getImage{ [weak self] (image, name) in
            self?.presenter.hideHUD()
        }
    }

    weak var presenter: ProductInfoPresenterProtocol!

    required init(presenter: ProductInfoPresenterProtocol) {
        self.presenter = presenter
    }
}
