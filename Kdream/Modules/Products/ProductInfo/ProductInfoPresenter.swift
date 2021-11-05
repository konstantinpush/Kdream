//
//  ProductInfoViewController.swift
//  Kdream
//
//  Created by Kasatin on 04.11.2021.
//

import Foundation

class ProductInfoPresenter: ProductInfoPresenterProtocol {

    weak var view: ProductInfoViewProtocol!
    var interactor: ProductInfoInteractorProtocol!
    var router: ProductInfoRouterProtocol!

    required init(view: ProductInfoViewProtocol) {
        self.view = view
    }
    
    var product: Product {
        get {
            return interactor.product
        }
    }
    // MARK: - ProductInfoPresenterProtocol methods
    func showHUD() {
        //
    }

    func showLoadCurrenciesButton() {
        //
    }

    func hideHUD() {
        //
    }

    func configureView() {
//        interactor.loadProductFromServer()

//        view.setUrlButtonTitle(with: interactor.urlRatesSource)
    }
}
