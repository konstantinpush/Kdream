//
//  ProductDetailsRouter.swift
//  Kdream
//
//  Created by Kasatin on 08.11.2021.
//

import Foundation

protocol ProductDetailsRouter {

    var presenter: ProductDetailsPresenter? { get set }

    func toggleBookmark(for post: Product)
}
