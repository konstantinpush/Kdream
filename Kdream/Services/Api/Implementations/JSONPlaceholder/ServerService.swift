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

protocol ServerServiceProtocol: class {
    var urlRatesSource: String { get }
    func openUrl(with urlString: String)
//    func getAllCurrencies(completion: @escaping ([String: Any]?, Error?) -> Swift.Void)
//    func getRatio(inputCurrencyShortName: String, outputCurrencyShortName: String, completion: @escaping ([String: Any]?, Error?) -> Swift.Void)
}

class ServerService: ServerServiceProtocol {

    var urlRatesSource: String {
        return "https://free.currencyconverterapi.com"
    }

    func openUrl(with urlString: String) {
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:])
        }
    }

        /// Get all categories with products from API
    func getAllCategoryFromServer(_ completion: @escaping ([Category]) -> Void) {
        getJSON(from: ApiUrls.getAllCategoryFromServer.rawValue, completion: completion)
    }

        /// Get all users from API
    func getAllUsersFromServer(_ completion: @escaping ([User]) -> Void) {
        getJSON(from: ApiUrls.getAllUsersFromServer.rawValue, completion: completion)
    }

        /// Get all products from API
    func getAllProductsFromServer(_ completion: @escaping ([Product]) -> Void) {
        getJSON(from: ApiUrls.getAllProductsFromServer.rawValue, completion: completion)
    }

        /// Get data from API Server with params
        /// - Parameter completion: [Category], [Product], [User]
    func getJSON<T>(from url: String, completion: @escaping ([T]) -> Void)
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
    private let URLAllCurrencies = "https://free.currencyconverterapi.com/api/v5/currencies"

    private func URLGetRatio(inputCurrencyShortName: String, outputCurrencyShortName: String) -> String {
        return "https://free.currencyconverterapi.com/api/v5/convert?q=\(inputCurrencyShortName)_\(outputCurrencyShortName)&compact=y"
    }
}

//денис у лехи - какие требования для джуна были
// пакеты packages и как часто их юзают
// доступ к данным устройсвта: фото, контакты и тд
// ролевое разграничение
