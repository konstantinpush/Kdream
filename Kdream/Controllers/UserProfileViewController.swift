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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        loadPhoto()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        userAvatar.image = user.avatar
        userName.text = user.name
        userRole.text = user.role
        loadPhoto()
    }
    
    func loadPhoto(){
        let imageUrl: URL = URL(string: "https://html.sammy-codes.com/images/background.jpg")!

        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            if let data = try? Data(contentsOf: imageUrl){
                DispatchQueue.main.async {
                    self.imgFromNet.image = UIImage(data: data)
                }
            }
        }
    }
}
