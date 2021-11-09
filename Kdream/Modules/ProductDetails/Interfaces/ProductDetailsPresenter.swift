//
//  ProductDetailsPresenter.swift
//  Kdream
//
//  Created by Kasatin on 08.11.2021.
//

import Foundation

protocol ProductDetailsPresenter: class {

    var router: ProductDetailsRouter? { get set }
    var interactor: ProductDetailsInteractor? { get set }
    var view: ProductDetailsView? { get set }

    func reload()
    func toggleBookmark()
}
