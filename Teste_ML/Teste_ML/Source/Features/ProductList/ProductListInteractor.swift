//
//  ProductListInteractor.swift
//  Teste_ML
//
//  Created by Bruna Drago on 25/09/21.
//

import Foundation

protocol ProductListInteractorProtocol {
    
    func fetchProducts()
}

class ProductListInteractor: ProductListInteractorProtocol {
    
    // MARK: - VIP Properties
    
    var presenter: ProductListPresenterProtocol!
    
    //MARK: - Public Properties
    
    var product: String!
    
    // MARK: - Private Properties
    
    private var productWorker: ProductWorkerProtocol
    
    private var productList: [APIResponse] = []
    
    // MARK: - Inits
    
    init() {
        productWorker = ProductWorker()
    }
    
    init(productWorker: ProductWorkerProtocol) {
        self.productWorker = productWorker
        
    }
    // MARK: - Public Functions
    
    func fetchProducts() {
        //  presenter.showLoading()
        productWorker.fetchList(for: product) { [weak self] result in
            guard let self = self else { return }
            
            // self.presenter.dismissLoading()
            
            switch result {
            case .success(let response):
                self.didFetchProducts(response)
            case .failure(let error):
                self.didFetchFailed(error)
            }
        }
    }
    
    //MARK: - Private Functions
    
    private func didFetchProducts(_ response: APIModel?) {
        let products = response?.results ?? []
        self.productList = products
        
        if products.isEmpty {
            DispatchQueue.main.async { self.didFetchEmptyState() }
            return
        }
        
        presenter.set(products: products)
    }
    
    private func didFetchFailed(_ error: Error){
        print(error.localizedDescription)
        let titleMessage = "Desculpe"
        let message = "Um erro ocorreu"
        let buttonTitle = "Ok"
        presenter.showAlert(title: titleMessage, message: message, buttonTitle: buttonTitle)
    }
    
    private func didFetchEmptyState() {
        let message = "Não encontramos resultados para sua busca"
        presenter.showEmptyState(message)
    }
}
