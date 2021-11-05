//
//  ProductInteractor.swift
//  Kdream
//
//  Created by Kasatin on 03.11.2021.
//

import Foundation

class ProductInteractor: ProductInteractorProtocol {
    
    var serverService: ServerService = ServerService()
    var productsFromServer = [Product]()
    var filteredProducts = [Product]()
    
    weak var presenter: ProductPresenterProtocol!

    required init(presenter: ProductPresenterProtocol) {
        self.presenter = presenter
    }

    func loadProductFromServer() {
        presenter.showHUD()
        serverService.getAllProductsFromServer{ [weak self] (products: [Product]) in
            self?.productsFromServer = products
            self?.presenter.updateTable()
            self?.presenter.hideHUD()
        }
    }
}
