//
//  ProductsProtocols.swift
//  Kdream
//
//  Created by Kasatin on 03.11.2021.
//

import Foundation
import UIKit

protocol ProductPresenterProtocol: class {
    var router: ProductRouterProtocol! { set get }
    func configureView()
    func updateTable()
    func showHUD()
    func showLoadCurrenciesButton()
    func hideHUD()
}

protocol ProductViewProtocol: class, GenericUIProtocols {
    func initSearchController()
    func updateTableData()
}
protocol ProductInteractorProtocol: class {
    var productsFromServer: [Product] { get set}
    var filteredProducts: [Product] { set get }
    func loadProductFromServer()
}

protocol ProductRouterProtocol: class {
    func openProductInfoPage()
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

protocol ProductConfiguratorProtocol: class {
    func configure(with viewController: ProductViewController)
}

//Presenter решает, куда перенаправить действие – на Router или Interactor.
//
//Router будет либо закрывать текущий экран, либо открывать новый. Конкретная реализация перехода осуществляется в нем.
//
//Interactor решает, что делать дальше с поступившими событиями и какой сервис вызвать. В нем содержится логика модуля.
