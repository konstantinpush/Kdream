//
//  ProductInfoConfigurator.swift
//  Kdream
//
//  Created by Kasatin on 04.11.2021.
//

import Foundation

class ProductInfoConfigurator: ProductInfoConfiguratorProtocol {

    func configure(with viewController: ProductInfoViewController) {
        var presenter = ProductInfoPresenter(view: viewController)
        var interactor = ProductInfoInteractor(presenter: presenter)
        var router = ProductInfoRouter(viewController: viewController)

        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
