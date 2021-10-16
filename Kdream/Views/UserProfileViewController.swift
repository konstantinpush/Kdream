//
//  UserProfileViewController.swift
//  Kdream
//
//  Created by Admin on 27.09.2021.
//

import UIKit

class UserProfileViewController: UIViewController {

    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userRole: UILabel!
    var user: User!
    override func viewDidLoad() {
        super.viewDidLoad()

        userAvatar.image = user.avatar
        userName.text = user.name
        userRole.text = user.role
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
