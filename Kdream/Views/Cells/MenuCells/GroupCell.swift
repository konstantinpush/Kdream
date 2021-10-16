//
//  GroupCell.swift
//  Kdream
//
//  Created by Admin on 13.08.2021.
//

import UIKit

class GroupCell: UICollectionViewCell {

    @IBOutlet weak var nameGroup: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func SetupCell(group: GroupProduct){
        self.nameGroup.text = group.name
    }
}
