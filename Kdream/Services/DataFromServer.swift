//
//  DataFromServer.swift
//  Kdream
//
//  Created by Kasatin on 26.09.2021.
//

import Foundation
import UIKit

enum ApiUrls: String {
    case getAllCategoryFromServer = "https://kdream.ru/API/GetCategoryFromServer"
    case getAllUsersFromServer = "https://kdream.ru/API/GetAllUsers"
    case getAllProductsFromServer = "https://kdream.ru/API/GetAllProducts"
}

class InfoFromServerService{
        /// Get all categories with products from API
    func getAllCategoryFromServer(_ completion: @escaping ([Category]) -> Void) {
        getData(from: ApiUrls.getAllCategoryFromServer.rawValue, completion: completion)
    }

        /// Get all users from API
    func getAllUsersFromServer(_ completion: @escaping ([User]) -> Void) {
        getData(from: ApiUrls.getAllUsersFromServer.rawValue, completion: completion)
    }

        /// Get all products from API
    func getAllProductsFromServer(_ completion: @escaping ([Product]) -> Void) {
        getData(from: ApiUrls.getAllProductsFromServer.rawValue, completion: completion)
    }

        /// Get data from API Server with params
        /// - Parameter completion: [Category], [Product], [User]
    func getData<T>(from url: String, completion: @escaping ([T]) -> Void)
    where T: Decodable {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("There was an error: \(error.localizedDescription)")
            } else {
                let jsonDecoder = JSONDecoder()
                if let data = data,
                   let products = try? jsonDecoder.decode([T].self, from: data) {
                    DispatchQueue.main.async {
                        completion(products)
                    }
                } else {
                    print("error")
                }
            }
        }.resume()
    }
}
