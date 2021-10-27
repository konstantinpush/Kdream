//
//  UserProfileViewController.swift
//  Kdream
//
//  Created by Admin on 27.09.2021.
//

import UIKit

class UserProfileViewController: UIViewController {

    @IBOutlet weak var imgFromNet: UIImageView!

    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userRole: UILabel!
    
    var user: User!
    var photoservice:PhotoService = PhotoService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userAvatar.image = user.avatar
        userName.text = user.name
        userRole.text = user.role

        photoservice.loadPhotoFromUrlClouser(_url: "https://html.sammy-codes.com/images/background.jpg"){ [weak self] img in
            self?.imgFromNet.image = img

            DispatchQueue.main.async {
                self?.imgFromNet.reloadInputViews()
            }
        }
    }
}
