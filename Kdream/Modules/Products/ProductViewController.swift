//
//  ProductViewController.swift
//  Kdream
//
//  Created by Kasatin on 03.11.2021.
//

import UIKit

class ProductViewController: UIViewController, UISearchResultsUpdating, UISearchControllerDelegate, ProductViewProtocol {

    @IBOutlet weak var tableProductsList: UITableView!
    @IBOutlet weak var HUDView: UIView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var loadCurrenciesButton: UIButton!

    let searchController = UISearchController()
    let selfToAboutSegueName = "goToProduct"

    var presenter: ProductPresenter!
    var configurator: ProductConfiguratorProtocol = ProductConfigurator()

    //MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()

        tableProductsList.delegate = self
        tableProductsList.dataSource = self

        initSearchController()
    }

    //MARK: - Action methods


    //MARK: - ProductViewProtocol methods

    func initSearchController() {
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

    func updateTableData() {
        DispatchQueue.main.async {
            self.tableProductsList.reloadData()
        }
    }

    //MARK: - searchController delegate methods
}
    extension ProductViewController: UITableViewDelegate, UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if searchController.isActive{
                return presenter.interactor.filteredProducts.count
            }
            print(presenter.interactor.productsFromServer.count)
            return presenter.interactor.productsFromServer.count
        }

        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 70
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableProductsList.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as! ProductTableViewCell

            let product: Product!

            if searchController.isActive{
                product = presenter.interactor.filteredProducts[indexPath.row]
            }
            else{
                product = presenter.interactor.productsFromServer[indexPath.row]
            }

            cell.productName.text = product.name
            product.getImage() { image, name in
                if name == cell.productName.text, let _cell = tableView.cellForRow(at: indexPath) as? ProductTableViewCell {
                     _cell.productImage.image = image
                }
            }
            return cell
        }

        func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
            let action = UITableViewRowAction(style: .destructive, title: "удалить"){_, indexPath in
                self.presenter.interactor.productsFromServer.remove(at: indexPath.row)
                self.tableProductsList.deleteRows(at: [indexPath], with: .automatic)
            }
            return [action]
        }


        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let product = presenter.interactor.productsFromServer[indexPath.row]

            let alert = UIAlertController(title: product.name, message: "\(product.price) руб.", preferredStyle: .actionSheet)

            let profileAction = UIAlertAction(title: "Редактировать", style: .default, handler: {(alert) in
                self.performSegue(withIdentifier: "goToProduct", sender: indexPath)
                })

            alert.addAction(profileAction)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

            self.present(alert, animated: true, completion: nil)
        }

        func updateSearchResults(for searchController: UISearchController) {
            let searchBar = searchController.searchBar
            let searchText = searchBar.text!
            filterSearchTextAndScopeButton(searchText)
        }

        func filterSearchTextAndScopeButton(_ searchText: String) {
            presenter.interactor.filteredProducts = presenter.interactor.productsFromServer.filter{
                user in
                if searchController.searchBar.text != ""{
                    let searchTextMatch = user.name.lowercased().contains(searchText.lowercased())
                    return searchTextMatch
                }
                else{
                    return true
                }
            }
            presenter.updateTable()
        }

        // MARK: - Navigation methods

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let indexPath = sender as! IndexPath
            let product: Product!

            if searchController.isActive{
                product = presenter.interactor.filteredProducts[indexPath.row]
            }
            else{
                product = presenter.interactor.productsFromServer[indexPath.row]
            }
            presenter.router.prepare(for: segue, sender: product)
        }
    }



//
//}
