//
//  ProductCell.swift
//  Kdream
//
//  Created by Admin on 11.08.2021.
//

import UIKit

class ProductCell: UICollectionViewCell {

    @IBOutlet weak var nameProduct: UILabel!
    @IBOutlet weak var priceProduct: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var clickForBuy: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.productImage.image = nil
    }
    func setupCell(product: Product){
        self.productImage.image = product.image
        self.nameProduct.text = product.name
        self.priceProduct.text = "\(product.price)"
        self.clickForBuy.titleLabel?.text = "В корзину"
    }

}
