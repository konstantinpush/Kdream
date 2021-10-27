//
//  ProductCell.swift
//  Kdream
//
//  Created by Admin on 11.08.2021.
//

import UIKit

class ProductCell: UICollectionViewCell {

    @IBOutlet weak var nameProduct: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var clickForBuy: UIButton!
    @IBOutlet weak var descriptionProduct: UITextView!
    
    @IBOutlet weak var btnToCart: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.productImage.image = nil
    }
    
    func setupCell(product: Product){
        self.productImage.layer.cornerRadius = 10
        self.productImage.image = product.image
        self.productImage.contentMode = UIImageView.ContentMode.scaleAspectFill
        
        self.nameProduct.text = product.name
        
        self.btnToCart.setTitle("\(product.price)", for: .normal)

        self.descriptionProduct.attributedText = htmlRaw(product.description ?? "")

    }

}

func htmlRaw(_ inputString: String) -> NSAttributedString?{
    let data = Data(inputString.utf8)
    
    if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
        return attributedString
    }
    else{
        print("error")
        return nil
    }
}
