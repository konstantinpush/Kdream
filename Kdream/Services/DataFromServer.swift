//
//  DataFromServer.swift
//  Kdream
//
//  Created by Admin on 26.09.2021.
//

import Foundation
import UIKit

class InfoFromServerService{
    
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
                    DispatchQueue.main.async {
                        completion(categories)
                    }
                    
                }else {
                    print(error)
                }
            }
        }.resume()
    }
    
    func getDataFromDatabase(completion: @escaping([Category]) -> Void) {
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
}
