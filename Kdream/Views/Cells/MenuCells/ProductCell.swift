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
//        self.productImage.image = product.image
        self.productImage.contentMode = UIImageView.ContentMode.scaleAspectFill
        
        self.nameProduct.text = product.name
        
        self.btnToCart.setTitle("\(product.price) руб.", for: .normal)
        
        
   
//        self.descriptionProduct.attributedText = htmlRaw(product.description ?? "")

        self.descriptionProduct.attributedText = product.description!.htmlAttributed(family: "Helvetica", size: 12, color: .systemGray)
    }

}
//
//func htmlRaw(_ inputString: String) -> NSAttributedString?{
//    let data = Data(inputString.utf8)
//
//    if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
//        return attributedString
//    }
//    else{
//        print("error")
//        return nil
//    }
//}

extension UIColor {
    var hexString: String {
        let components = cgColor.components
        let r: CGFloat = components?[0] ?? 0.0
        let g: CGFloat = components?[1] ?? 0.0
        let b: CGFloat = components?[2] ?? 0.0

        let hexString = String(format: "#%02lX%02lX%02lX", lroundf(Float(r * 255)), lroundf(Float(g * 255)),
                               lroundf(Float(b * 255)))

        return hexString
    }
}

extension String {
    func htmlAttributed(family: String?, size: CGFloat, color: UIColor) -> NSAttributedString? {
        do {
            let htmlCSSString = "<style>" +
                "html *" +
                "{" +
                "font-size: \(size)pt !important;" +
                "color: #\(color.hexString) !important;" +
                "font-family: \(family ?? "Helvetica"), Helvetica !important;" +
            "}</style> \(self)"

            guard let data = htmlCSSString.data(using: String.Encoding.utf8) else {
                return nil
            }

            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
}
