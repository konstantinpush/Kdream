//
//  AboutConfigurator.swift
//  Kdream
//
//  Created by Kasatin on 02.11.2021.
//

import Foundation
import UIKit

class AboutConfigurator: AboutConfiguratorProtocol {

    func configure(with viewController: AboutViewController) {
        let presenter = AboutPresenter(view: viewController)
        let interactor = AboutInteractor(presenter: presenter)
        let router = AboutRouter(viewController: viewController)

        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
