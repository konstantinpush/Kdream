//
//  UserPresenter.swift
//  Kdream
//
//  Created by Kasatin on 06.11.2021.
//

import Foundation

class UserPresenter: UserPresenterProtocol {
    weak var view: UserViewProtocol!
    var interactor: UserInteractorProtocol!
    var router: UserRouterProtocol!

    required init(view: UserViewProtocol) {
        self.view = view
    }

    // MARK: - AboutPresenterProtocol methods

    func configureView() {
        interactor.loadUsersFromServer()
    }

    func updateTable() {
        view?.updateTableData()
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
