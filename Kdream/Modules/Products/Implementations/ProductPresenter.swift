//
//  ProductPresenter.swift
//  Kdream
//
//  Created by Kasatin on 03.11.2021.
//

import Foundation

class ProductPresenter: ProductPresenterProtocol {

    weak var view: ProductViewProtocol!
    var interactor: ProductInteractorProtocol!
    var router: ProductRouterProtocol!

    required init(view: ProductViewProtocol) {
        self.view = view
    }

    // MARK: - AboutPresenterProtocol methods

    func configureView() {
        interactor.loadProductFromServer()
    }

    func updateTable() {
        view?.updateTable()
    }
    func showHUD() {
        view.showHUD()
    }

    func showLoadCurrenciesButton() {
        view.showLoadCurrenciesButton()
    }

    func hideHUD() {
        view.hideHUD()
    }
}
