//
//  ProductInfoViewController.swift
//  Kdream
//
//  Created by Kasatin on 25.10.2021.
//

import UIKit

class ProductInfoViewController: UIViewController {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UITextField!
    @IBOutlet weak var productPrice: UITextField!
    
    var product: Product!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        productImage.image = product.image
//        productName.text = product.name
//        productPrice.text = "цена: \(product.price)"
    }
}
