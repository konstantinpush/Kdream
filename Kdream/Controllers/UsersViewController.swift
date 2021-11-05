//
//  UsersViewController.swift
//  Kdream
//
//  Created by Admin on 26.09.2021.
//

import UIKit

class UsersViewController: UIViewController, UISearchResultsUpdating, UISearchControllerDelegate {
   
    var filteredUsers = [User]()
    let searchController = UISearchController()
    
    var service: ServerService = ServerService()
    var usersFromServer = [User]()
    
    @IBOutlet weak var tableUserList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let loader = self.loader()
        
        tableUserList.delegate = self
        tableUserList.dataSource = self
        
        initSearchController()
        
        var InfoFromServerService = ServerService()
        
        service.getAllUsersFromServer() { [weak self] users in
            self?.usersFromServer = users
            DispatchQueue.main.async {
                self?.tableUserList.reloadData()
                self?.stopLoader(loader: loader)
            }

        }
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

extension UsersViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive{
            return filteredUsers.count
        }
        return usersFromServer.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableUserList.dequeueReusableCell(withIdentifier: "UserTableViewCell") as! UserTableViewCell
        
        let user: User!
        
        if searchController.isActive{
            user = filteredUsers[indexPath.row]
        }
        else{
            user = usersFromServer[indexPath.row]
        }

        cell.userName.text = user.name
        user.getImage() { image, name in
            if name == cell.userName.text, let _cell = tableView.cellForRow(at: indexPath) as? UserTableViewCell {
                 _cell.userAvatar.image = image
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = usersFromServer[indexPath.row]
        
        let alert = UIAlertController(title: user.name, message: user.role, preferredStyle: .actionSheet)
        
        let profileAction = UIAlertAction(title: "Профиль", style: .default, handler: {(alert) in
                self.performSegue(withIdentifier: "goToProfile", sender: indexPath)
            })
        
        alert.addAction(profileAction)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToProfile"{
            let vc = segue.destination as! UserProfileViewController
            let indexPath = sender as! IndexPath
            let user: User!
            
            if searchController.isActive{
                user = filteredUsers[indexPath.row]
            }
            else{
                user = usersFromServer[indexPath.row]
            }
            vc.user = user
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let searchText = searchBar.text!
        filterSearchTextAndScopeButton(searchText)
    }
    
    func filterSearchTextAndScopeButton(_ searchText: String){
        filteredUsers = usersFromServer.filter{
            user in
            if searchController.searchBar.text != ""{
                let searchTextMatch = user.name.lowercased().contains(searchText.lowercased())
                return searchTextMatch
            }
            else{
                return true
            }
        }
        tableUserList.reloadData()
    }
}
