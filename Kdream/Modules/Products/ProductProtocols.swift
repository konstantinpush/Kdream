//
//  ProductsProtocols.swift
//  Kdream
//
//  Created by Kasatin on 03.11.2021.
//

import Foundation
import UIKit

protocol ProductViewProtocol: class, GenericUIProtocol {
    func initSearchController()
    func updateTable()
}

protocol ProductInteractorProtocol: class {
    var productsFromServer: [Product] { get set}
    var filteredProducts: [Product] { set get }
    func loadProductFromServer()
}

protocol ProductPresenterProtocol: class {
    var router: ProductRouterProtocol! { set get }
    func configureView()
    func updateTable()
    func showHUD()
    func showLoadCurrenciesButton()
    func hideHUD()
}

protocol ProductRouterProtocol: class {
    func openProductInfoPage()
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

protocol ProductConfiguratorProtocol: class {
    func configure(with viewController: ProductViewController)
}
