//
//  ProductInfoDetailsPresenter.swift
//  Teste_ML
//
//  Created by Bruna Drago on 25/09/21.
//

import Foundation

protocol ProductInfoDetailsPresenterProtocol {

    func set(product: APIResponse)
    
    func showDetails(for url: String)
    
    func showAlert(title: String, message: String, buttonTitle: String)
}

class ProductInfoDetailsPresenter: ProductInfoDetailsPresenterProtocol {

    // MARK: - VIP Properties

    weak var viewController: ProductInfoDetailsViewControllerProtocol!

    // MARK: - Inits

    init() {}

    // MARK: - Public Functions

    func set(product: APIResponse) {
        viewController.set(product: product)
    }
    
    func showDetails(for url: String) {
        viewController.showDetails(for: url)
    }
    
    func showAlert(title: String, message: String, buttonTitle: String) {
        viewController.showAlert(title: title, message: message, buttonTitle: buttonTitle)
    }
}
