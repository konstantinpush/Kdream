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

    // MARK: - ProductInfoPresenterProtocol methods
    func showHUD() {
        view.showHUD()
    }

    func showLoadCurrenciesButton() {
        view.showLoadCurrenciesButton()
    }

    func hideHUD() {
        view.hideHUD()
    }

    func configureView() {
//        view.setImage(with: interactor.product.mainphoto)
    }
}
