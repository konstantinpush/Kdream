//
//  ext.swift
//  Kdream
//
//  Created by Kasatin on 02.11.2021.
//

import Foundation
import UIKit

extension UIViewController{
    func loader() -> UIAlertController {
            let alert = UIAlertController(title: nil, message: "Загрузка..", preferredStyle: .alert)
            let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
            loadingIndicator.hidesWhenStopped = true
            loadingIndicator.style = UIActivityIndicatorView.Style.large
            loadingIndicator.startAnimating()
            alert.view.addSubview(loadingIndicator)
        self.present(alert, animated: true, completion: nil)
            return alert
        }

        func stopLoader(loader : UIAlertController) {
            DispatchQueue.main.async {
                loader.dismiss(animated: true, completion: nil)
            }
        }
}
