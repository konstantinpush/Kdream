//
//  DataFromServer.swift
//  Kdream
//
//  Created by Admin on 26.09.2021.
//

import Foundation
import UIKit

class InfoFromServerService{
    
    func getAllCategoryFromServer(_ completion: @escaping ([Category]) -> Void) {
        guard let url = URL(string: "https://kdream.ru/API/GetCategoryFromServer") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("There was an error: \(error.localizedDescription)")
            } else {
                let jsonDecoder = JSONDecoder()
                if let data = data,
                   let categories = try? jsonDecoder.decode([Category].self, from: data)  {
                    DispatchQueue.main.async {
                        completion(categories)
                        
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newDataNotif"), object: nil)
                        
                    }
                }else {
                    print("error")
                }
            }
        }.resume()
    }
    
    func getAllUsersFromServer(_ completion: @escaping ([User]) -> Void) {
        guard let url = URL(string: "https://kdream.ru/API/GetAllUsers") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("There was an error: \(error.localizedDescription)")
            } else {
                let jsonDecoder = JSONDecoder()
                if let data = data,
                   let users = try? jsonDecoder.decode([User].self, from: data)  {
                    DispatchQueue.main.async {
                        completion(users)
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newDataNotif"), object: nil)
                    }
                    
                }else {
                    print("error")
                }
            }
        }.resume()
    }
    
    func getAllProductsFromServer(_ completion: @escaping ([Product]) -> Void) {
        guard let url = URL(string: "https://kdream.ru/API/GetAllProducts") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("There was an error: \(error.localizedDescription)")
            } else {
                let jsonDecoder = JSONDecoder()
                if let data = data,
                   let products = try? jsonDecoder.decode([Product].self, from: data)  {
                    DispatchQueue.main.async {
                        completion(products)
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newDataNotif"), object: nil)
                    }
                    
                }else {
                    print("error")
                }
            }
        }.resume()
    }
    
    
}

// shift del ????
// повтор содержания функции
    //дебаг
    //tests
    // sample of protocols
// clousers
//services
//patterns
//dedlocks
//что требуется для джуна
// что требуется для неоф раб
