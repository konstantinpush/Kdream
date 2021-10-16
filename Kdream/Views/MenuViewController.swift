//
//  MenuViewController.swift
//  Kdream
//
//  Created by Admin on 11.08.2021.
//

import UIKit

class MenuViewController: UIViewController{
    
    var menu: Menu = Menu()
    var selectedGroupIndex = 0
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var groupsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: "ProductCell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        groupsCollectionView.register(UINib(nibName: "GroupCell", bundle: nil), forCellWithReuseIdentifier: "GroupCell")
        self.groupsCollectionView.dataSource = self
        self.groupsCollectionView.delegate = self
    }

}
extension MenuViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == groupsCollectionView{
            return menu.groups.count
        }
        else{
            let group = menu.groups[selectedGroupIndex]
            return group.products.count
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == groupsCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroupCell", for: indexPath) as! GroupCell
            let group = menu.groups[indexPath.item]
            cell.SetupCell(group: group)
            return cell
        }
        else{
            let group = menu.groups[selectedGroupIndex]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
            let product = group.products[indexPath.item]
            cell.setupCell(product: product)
            return cell
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == groupsCollectionView{
            let groupName = menu.groups[indexPath.item].name
            let width = groupName.widthOfSrting(usingFont: UIFont.systemFont(ofSize: 17))
            return CGSize(width: width+20, height: collectionView.frame.height)
        }else{
            return CGSize(width: UIScreen.main.bounds.width-10, height: UIScreen.main.bounds.width)
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == groupsCollectionView{
            self.selectedGroupIndex = indexPath.item
            self.collectionView.scrollToItem(at: IndexPath(item:0, section:0), at: .centeredHorizontally, animated: false)
            self.collectionView.reloadData()
        }else{

        }
    }
}
