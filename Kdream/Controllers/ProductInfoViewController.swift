//
//  ProductInfoViewController.swift
//  Kdream
//
//  Created by Kasatin on 25.10.2021.
//

import UIKit

class ProductInfoViewController: UIViewController {

//    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UITextField!
    @IBOutlet weak var productPrice: UITextField!
    @IBOutlet weak var blurView1: UIView!
    
    var product: Product!
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
        
        product.getImage() { image, name in
            self.productImage.image = image
        }
        setupImageView()


        view.addSubview(blurView)

        blurView.effect = blurEffect
        setupBlurEffect()

        lblNameOfProduct.text = product.name

        blurView.contentView.addSubview(lblNameOfProduct)
        lblNameOfProduct.centerXAnchor.constraint(equalTo: blurView.centerXAnchor).isActive = true
        lblNameOfProduct.centerYAnchor.constraint(equalTo: blurView.centerYAnchor).isActive = true
    }

    func setupImageView(){
        view.addSubview(productImage)
        productImage.translatesAutoresizingMaskIntoConstraints = false
        productImage.contentMode = .scaleAspectFill

        productImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        productImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        productImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        productImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    func setupBlurEffect(){
        blurView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        blurView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
