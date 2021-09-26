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
    
    private var productList: [Products] = []
    
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
                self.didFetchSuccess(response)
            case .failure:
                self.didFetchFailed()
            }
        }
    }
    
    //MARK: - Private Functions
    
    private func didFetchSuccess(_ response: [Results]?) {
        guard let results = response else { return }
        print("===== RESPONSE: \(response)")
//        for produtcs in results{
//            self.productList.append(contentsOf: produtcs)
//        }
        
        if results.isEmpty {
            DispatchQueue.main.async { self.didFetchEmptyState() }
            return
        }
        
      //  presenter.set(products: )
    }
    
    private func didFetchFailed(){
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
