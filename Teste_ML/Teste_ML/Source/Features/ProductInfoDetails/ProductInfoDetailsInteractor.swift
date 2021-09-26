//
//  ProductInfoDetailsInteractor.swift
//  Teste_ML
//
//  Created by Bruna Drago on 25/09/21.
//

import Foundation

protocol ProductInfoDetailsInteractorProtocol {

    func showDetails()
    
    func setData()
}

class ProductInfoDetailsInteractor: ProductInfoDetailsInteractorProtocol {

    // MARK: - VIP Properties

    var presenter: ProductInfoDetailsPresenterProtocol!

    // MARK: - Public Properties
    
    var product: APIResponse!

    // MARK: - Inits

    init() {}

    // MARK: - Public Functions
    
    func setData() {
        presenter.set(product: product)
    }

    func showDetails() {
        guard let detailsURL = product.permalink else {
            self.didFetchFailed()
            return
        }
        
        presenter.showDetails(for: detailsURL)
    }
    
    private func didFetchFailed() {
        let titleMessage = "Desculpe"
        let message = "Não foi possível carregar a página"
        let buttonTitle = "Ok"
        presenter.showAlert(title: titleMessage, message: message, buttonTitle: buttonTitle)
    }
}
