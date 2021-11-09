//
//  ProductDetailsView.swift
//  Kdream
//
//  Created by Kasatin on 08.11.2021.
//

import Foundation

protocol ProductDetailsView: class {

    var presenter: ProductDetailsPresenter? { get set }

    func setup(with bookmark: Bookmark)
    func display(_ comments: [Comment])
}
