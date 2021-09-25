//
//  SearchInteractor.swift
//  Teste_ML
//
//  Created by Bruna Drago on 25/09/21.
//

import Foundation

protocol SearchDataStoreProtocol {
    
    var product: String? { get set }
}

protocol SearchInteractorProtocol {

    func validate(_ product: String)
}

class SearchInteractor: SearchInteractorProtocol, SearchDataStoreProtocol {
    
    // MARK: - VIP Properties

    var presenter: SearchPresenterProtocol!

    //MARK: - Public Properties
    
    var product: String?

    // MARK: - Inits

    init() {}

    // MARK: - Public Functions

    func validate(_ product: String) {
        guard validate(product) else { return }
        self.product = product
        presenter.searchsearchForProducts()
    }
 
    //MARK: - Private Functions

   private func validate(_ product: String) -> Bool {
    let isProductNameEmpty = product.isEmpty
    let isProductValid = isProductValid(product)
    
    if isProductNameEmpty {
        let titleMessage = "Olá"
        let message = "Por favor digite o produto procurado"
        let buttonTitle = "Ok"
        presenter.showAlert(title: titleMessage, message: message, buttonTitle: buttonTitle)
        return false
    }
    
    if !isProductValid {
        let titleMessage = "Olá"
        let message = "O produto digitado"
        let buttonTitle = "Ok"
        presenter.showAlert(title: titleMessage, message: message, buttonTitle: buttonTitle)
        return false
    }
        return true
    }
    
    private func isProductValid(_ item: String) -> Bool {
        let product = item
        return product.count > 2
    }
}
