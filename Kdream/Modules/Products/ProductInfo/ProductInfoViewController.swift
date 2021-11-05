//
//  ProductInfoViewController.swift
//  Kdream
//
//  Created by Kasatin on 04.11.2021.
//

import UIKit

class ProductInfoViewController: UIViewController, ProductInfoViewProtocol {


    @IBOutlet weak var HUDView: UIView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var loadCurrenciesButton: UIButton!

    var presenter: ProductInfoPresenter!

//    var product: Product!
    let productImage = UIImageView()

    let blurView: UIVisualEffectView = {
        let view = UIVisualEffectView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let blurEffect = UIBlurEffect(style: .light)

    let lblNameOfProduct: UILabel = {
        let txtNameOfProduct = UILabel()
        txtNameOfProduct.text = "111"
        txtNameOfProduct.textColor = .gray
        txtNameOfProduct.font = UIFont.systemFont(ofSize: 30)
        txtNameOfProduct.translatesAutoresizingMaskIntoConstraints = false
        return txtNameOfProduct
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(presenter.interactor.product.name ?? "не пришло")
        // Do any additional setup after loading the view.
    }

    //MARK: - protocols methods
    func showHUD() {
        DispatchQueue.main.async {
            self.view.bringSubviewToFront(self.HUDView)
            self.activityIndicatorView.alpha = 1
            self.loadCurrenciesButton.alpha = 0
            UIView.animate(withDuration: 0.5) {
                self.HUDView.alpha = 1
            }
        }
    }

    func showLoadCurrenciesButton() {
        DispatchQueue.main.async {
            self.view.bringSubviewToFront(self.HUDView)
            self.activityIndicatorView.alpha = 0
            self.loadCurrenciesButton.alpha = 1
            UIView.animate(withDuration: 0.5) {
                self.HUDView.alpha = 1
            }
        }
    }

    func hideHUD() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5) {
                self.HUDView.alpha = 0
            }
        }
    }
}
