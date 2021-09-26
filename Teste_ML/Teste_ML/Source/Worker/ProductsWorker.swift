//
//  ProductsWorker.swift
//  Teste_ML
//
//  Created by Bruna Drago on 26/09/21.
//

import Foundation

typealias ProductResult = (Result<[Results]?,MLError>) -> Void

protocol ProductWorkerProtocol {
    
    func fetchList(for username: String, completion: @escaping ProductResult)
}

class ProductWorker: ProductWorkerProtocol {
    
    func fetchList(for product: String, completion: @escaping ProductResult) {
        let url = URLBuilder()
            .set(product: product)
            .build()
        
        print("=====URL:\(url)")
        
        requestProducts(url, completion: completion)
    }
    
    // MARK: - Private Functions
    
    private func requestProducts(_ url: String, completion: @escaping ProductResult) {
        NetworkManager.request(url: url) { result in
            completion(result)
        }
    }
}
