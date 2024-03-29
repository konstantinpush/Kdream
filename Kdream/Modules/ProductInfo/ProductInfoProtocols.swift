//
//  ProductInfoProtocols.swift
//  Kdream
//
//  Created by Kasatin on 04.11.2021.
//

import Foundation
import UIKit

protocol ProductInfoViewProtocol: AnyObject, GenericUIProtocol {
//    func setImage(with image: UIImage)
}

protocol ProductInfoInteractorProtocol: AnyObject {
    var product: Product { get set }
}

protocol ProductInfoPresenterProtocol: AnyObject {
    var router: ProductInfoRouterProtocol! { set get }
    func configureView()
    func showHUD()
    func showLoadCurrenciesButton()
    func hideHUD()
}

protocol ProductInfoConfiguratorProtocol: AnyObject {
    func configure(with viewController: ProductInfoViewController)
}

protocol ProductInfoRouterProtocol: AnyObject {
    func closeCurrentViewController()
}
