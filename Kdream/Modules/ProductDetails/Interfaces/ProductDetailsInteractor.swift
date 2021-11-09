//
//  ProductDetailsInteractor.swift
//  Kdream
//
//  Created by Kasatin on 08.11.2021.
//

import Foundation

protocol ProductDetailsInteractor {

    var presenter: ProductDetailsPresenter? { get set }

    func comments(for post: Product) -> Promise<[Comment]>

    func bookmark(for post: Product) -> Bookmark
}
