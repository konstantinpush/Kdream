//
//  ProductConfigurator.swift
//  Kdream
//
//  Created by Kasatin on 03.11.2021.
//

import Foundation

class ProductConfigurator: ProductConfiguratorProtocol {
    func configure(with viewController: ProductViewController) {
        var presenter = ProductPresenter(view: viewController)
        var interactor = ProductInteractor(presenter: presenter)
        var router = ProductRouter(viewController: viewController)

        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
//        var presenterInfo = ProductInfoPresenter(view: ProductInfoViewController)
    }
}
