//
//  ProductListPresenter.swift
//  Teste_ML
//
//  Created by Bruna Drago on 25/09/21.
//

import Foundation

protocol ProductListPresenterProtocol {

    func set(products: [APIResponse])
    
    func showAlert(title: String, message: String, buttonTitle: String)
    
    func showLoading()
    
    func dismissLoading()
    
    func showEmptyState(_ message: String)
}

class ProductListPresenter: ProductListPresenterProtocol {

    // MARK: - VIP Properties

    weak var viewController: ProductListViewControllerProtocol!

    // MARK: - Private Properties
    
    // Put here your private properties

    // MARK: - Inits

    init() {}

    // MARK: - Public Functions
    
    func set(products: [APIResponse]) {
        viewController.set(products: products)
    }

    func showAlert(title: String, message: String, buttonTitle: String) {
        viewController.showAlert(title: title, message: message, buttonTitle: buttonTitle)
    }
    
    func showLoading() {
      //  viewController.showLoading()
    }
    
    func dismissLoading() {
      //  viewController.dismissLoading()
    }
    
    func showEmptyState(_ message: String) {
        viewController.showEmptyState(message)
    }
}
