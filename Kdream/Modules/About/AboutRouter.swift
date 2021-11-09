//
//  AboutRouter.swift
//  Kdream
//
//  Created by Kasatin on 02.11.2021.
//

import Foundation
import UIKit

class AboutRouter: AboutRouterProtocol {

    weak var viewController: AboutViewController!

    init(viewController: AboutViewController) {
        self.viewController = viewController
    }

    func closeCurrentViewController() {
        viewController.dismiss(animated: true, completion: nil)
    }
}
