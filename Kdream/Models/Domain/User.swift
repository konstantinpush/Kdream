//
//  User.swift
//  Kdream
//
//  Created by Admin on 26.09.2021.
//

import Foundation
import UIKit

class User:NSObject{
    var urlImage: String
    var avatar: UIImage{
        get{
            return PhotoService.loadPhotoFromUrl(_url: urlImage)
        }
        set{
            //
        }
    }
    var name: String
    var role:String

    init(urlImage:String, name: String, role: String){
        self.urlImage = urlImage
        self.name = name
        self.role = role
    }
    
    static func getUsersFromServer(){
        
    }
    
    static func generateUsers() -> [User]{
        let usr1 = User(urlImage: "https://avatars.mds.yandex.net/get-kinopoisk-post-img/2268018/e61cf2df803fb10d6c668804757cc3d9/960x540", name: "джони депчик", role: "Администратор")
       
        let usr2 = User(urlImage: "https://fazarosta.com/wp-content/uploads/2018/03/dostojnyj-muzhchina-nikogda-ne-sdelaet-jetogo2-945x630.jpg", name: "kasatin4ik", role: "Менедждер")
        
        let usr3 = User(urlImage: "https://www.passion.ru/thumb/750x0/filters:quality(75)/imgs/2017/05/12/14/787219/76c0f20dcf1a80a446674ec6677a681084ff2b38.jpg", name: "Руслан", role: "Пользователь")
        
        let usr4 = User(urlImage: "https://www.kino-teatr.ru/person/515/6157.jpg", name: "Марина", role: "Пользователь")
        
        let users = [usr1, usr2, usr3, usr4]
        return users
    }
    

}
