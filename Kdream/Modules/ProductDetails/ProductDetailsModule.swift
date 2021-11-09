//
//  ProductDetailsModule.swift
//  Kdream
//
//  Created by Kasatin on 08.11.2021.
//

import Foundation
import UIKit

protocol ProductDetailsModuleDelegate: class {
    func toggleBookmark(for post: Product)
}

class PostDetailsModule {

    func buildDefault(with post: Product, delegate: ProductDetailsModuleDelegate? = nil) -> UIViewController {
        let view = ProductDetailsDefaultView()
        let interactor = ProductDetailsDefaultInteractor(apiService: App.shared.apiService,
                                                      bookmarkService: App.shared.bookmarkService)
        let presenter = ProductDetailsDefaultPresenter(post: post)
        let router = ProductDetailsDefaultRouter()

        view.presenter = presenter

        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router

        interactor.presenter = presenter

        router.presenter = presenter
        router.viewController = view
        router.delegate = delegate

        return view
    }
}
