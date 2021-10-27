//
//  UsersViewController.swift
//  Kdream
//
//  Created by Admin on 26.09.2021.
//

import UIKit

class ProductsViewController: UIViewController, UISearchResultsUpdating, UISearchControllerDelegate {
   
    var filteredProducts = [Product]()
    let searchController = UISearchController()
    
    var service: InfoFromServerService = InfoFromServerService()
    var productsFromServer = [Product]()
    
    @IBOutlet weak var tableProductsList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableProductsList.delegate = self
        tableProductsList.dataSource = self
        
        initSearchController()
        
        service.getAllProductsFromServer() { [weak self] products in
            self?.productsFromServer = products
            
//            DispatchQueue.main.async {
//                self?.tableProductsList.reloadData()
//            }
        }
        NotificationCenter.default.addObserver(self, selector: #selector(self.refresh), name: NSNotification.Name(rawValue: "newDataNotif"), object: nil)
     }
    @objc func refresh() {
        tableProductsList.reloadData() // a refresh the tableView.
    }
    
    func initSearchController(){
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        searchController.searchBar.placeholder = "Поиск"
        definesPresentationContext = true
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
}

extension ProductsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive{
            return filteredProducts.count
        }
        return productsFromServer.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableProductsList.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as! ProductTableViewCell
        
        let product: Product!
        
        if searchController.isActive{
            product = filteredProducts[indexPath.row]
        }
        else{
            product = productsFromServer[indexPath.row]
        }
        
        cell.productName.text = product.name
        cell.productImage.image = product.image
//        cell.productPrice.text = product.price
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let product = productsFromServer[indexPath.row]
//
//        let alert = UIAlertController(title: product.name, message: product.description, preferredStyle: .actionSheet)
//
//        let profileAction = UIAlertAction(title: "Профиль", style: .default, handler: {(alert) in
                self.performSegue(withIdentifier: "goToProduct", sender: indexPath)
//            })
        
//        alert.addAction(profileAction)
//        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//
//        self.present(alert, animated: true, completion: nil)
    }
        
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "goToProduct"{
//            let vc = segue.destination as! ProductsProfileViewController
//            let indexPath = sender as! IndexPath
//            let product: Product!
//
//            if searchController.isActive{
//                product = filteredProducts[indexPath.row]
//            }
//            else{
//                product = productsFromServer[indexPath.row]
//            }
//            vc.user = user
//        }
//    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let searchText = searchBar.text!
        filterSearchTextAndScopeButton(searchText)
    }
    
    func filterSearchTextAndScopeButton(_ searchText: String){
        filteredProducts = productsFromServer.filter{
            user in
            if searchController.searchBar.text != ""{
                let searchTextMatch = user.name.lowercased().contains(searchText.lowercased())
                return searchTextMatch
            }
            else{
                return true
            }
        }
        tableProductsList.reloadData()
    }

    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let offsetY = scrollView.contentOffset.y
//        let contentHeight = scrollView.contentSize.height
//        print("offset \(offsetY) | contentHeight \(contentHeight)")
//    }
}


