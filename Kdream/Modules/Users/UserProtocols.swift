//
//  UserProtocols.swift
//  Kdream
//
//  Created by Kasatin on 06.11.2021.
//

import Foundation

import UIKit

protocol UserViewProtocol: class, GenericUIProtocol {
    func initSearchController()
    func updateTableData()
}

protocol UserInteractorProtocol: class {
    var usersFromServer: [User] { get set}
    var filteredUsers: [User] { set get }
    func loadUsersFromServer()
}

protocol UserPresenterProtocol: class {
    var router: UserRouterProtocol! { set get }
    func configureView()
    func updateTable()
    func showHUD()
    func showLoadCurrenciesButton()
    func hideHUD()
}

protocol UserRouterProtocol: class {
    func openUserInfoPage()
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

protocol UserConfiguratorProtocol: class {
    func configure(with viewController: UserViewController)
}



