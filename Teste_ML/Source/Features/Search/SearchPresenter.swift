//
//  SearchPresenter.swift
//  Teste_ML
//
//  Created by Bruna Drago on 25/09/21.
//

import Foundation

protocol SearchPresenterProtocol {
    
    func showAlert(title: String, message: String, buttonTitle: String)
    
    func searchForProducts()
}

class SearchPresenter: SearchPresenterProtocol {
    
    // MARK: - VIP Properties
    
    weak var viewController: SearchViewControllerProtocol!
    
    // MARK: - Inits
    
    init() {}
    
    // MARK: - Public Functions
    
    func showAlert(title: String, message: String, buttonTitle: String) {
        viewController.showAlert(title: title, message: message, buttonTitle: buttonTitle)
    }
    
    func searchForProducts() {
        viewController.searchForProducts()
    }
}
