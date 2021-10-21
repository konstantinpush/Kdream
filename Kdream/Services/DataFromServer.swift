//
//  DataFromServer.swift
//  Kdream
//
//  Created by Admin on 26.09.2021.
//

import Foundation
import UIKit

class InfoFromServerService{
    
    func getProductsFromServer(_ completion: @escaping ([Category]) -> Void) {
        var categories = [Category]()
        let urlString = "https://kdream.ru/API/GetCategoryFromServer"
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
               let categories = try? jsonDecoder.decode([Category].self, from: data)  {
                print(categories)
                completion(categories)
            }else {
                print(error)
            }
        }
        task.resume()
    }
    
    func jsonDataRequest() {
        guard let request = URL(string: "https://kdream.ru/API/GetCategoryFromServer") else {return}
        
//        let session = URLSession.shared.dataTask(with: url) {
//            data, response, error in
//
//            if let error = error{
//                print("ошибка: \(error.localizedDescription)")
//            }else{
//                let jsonRes = try? JSONSerialization.jsonObject(with: data!, options: [])
//                print("\(jsonRes)")
//            }
//        }.resume()
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            if error == nil {
                do {

                    let jsonObj = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [[String:Any]]
                    if let user = jsonObj?.first {
                        print(user["name"])
                        DispatchQueue.main.async {
                             print(000)
                        }

                    }
                }
                catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    func getPosts(_ completion: @escaping ([Category]) -> Void) {
        guard let url = URL(string: "https://kdream.ru/API/GetCategoryFromServer") else { return }
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("There was an error: \(error.localizedDescription)")
            } else {
                let jsonRes = try? JSONSerialization.jsonObject(with: data!, options: [])
                
                let jsonDecoder = JSONDecoder()
                if let data = data,
                   let categories = try? jsonDecoder.decode([Category].self, from: data)  {
                    completion(categories)
                }else {
                    print(error)
                }
            }
        }.resume()
    }
    
    
    public func getProductsFromServer1()->[Category] {
            
            var categories = [Category]()
            let urlString = "https://kdream.ru/API/GetCategoryFromServer"
            if let url = URL(string: urlString) {
                
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data, error == nil else { return }
                    DispatchQueue.main.async {
                        do{
                            categories = try JSONDecoder().decode([Category].self, from: data)
                            print("получено от сервера: \(categories.count)")
                        }catch{
                            print(error)
                        }
                    }
                }
                task.resume()
            }
        return categories
        
    }

}
