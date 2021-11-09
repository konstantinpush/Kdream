//
//  UserRouter.swift
//  Kdream
//
//  Created by Kasatin on 06.11.2021.
//

import Foundation
import UIKit

class UserRouter: UserRouterProtocol{

    weak var viewController: UserViewController!

    init(viewController: UserViewController){
        self.viewController = viewController
    }

    func openUserInfoPage() {
        viewController.performSegue(withIdentifier: viewController.selfToAboutSegueName, sender: "11")
    }

    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToUser"{
//            let vc = segue.destination as! UserInfoViewController
//            vc.product = sender as! User
        }
    }
}

