//
//  UserInteractor.swift
//  Kdream
//
//  Created by Kasatin on 06.11.2021.
//

import Foundation

class UserInteractor: UserInteractorProtocol {

    var serverService: ServerService = ServerService()
    var usersFromServer = [User]()
    var filteredUsers = [User]()

    weak var presenter: UserPresenterProtocol!

    required init(presenter: UserPresenterProtocol) {
        self.presenter = presenter
    }

    func loadUsersFromServer() {
        presenter.showHUD()
        serverService.getAllUsersFromServer{ [weak self] (users: [User]) in
            self?.usersFromServer = users
            self?.presenter.updateTable()
            self?.presenter.hideHUD()
        }
    }
}
