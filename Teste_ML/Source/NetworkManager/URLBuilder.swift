//
//  URLBuilder.swift
//  Teste_ML
//
//  Created by Bruna Drago on 26/09/21.
//

import Foundation

struct MLAPI {
    
    // MARK: - Public Properties
    
    static let baseURL: String = "https://api.mercadolibre.com/"
}

class URLBuilder {
    
    // MARK: - Private Properties
    
    private var url: String
    
    // MARK: - Inits
    
    init() {
        self.url = "\(MLAPI.baseURL)"
    }
    
    // MARK: - Public Functions
    
//    Request: https://api.mercadolibre.com/sites/MLA/search?q=Motorola
//    Params: Motorola
  
    
    func set(product: String) -> URLBuilder {
        let params = product.removingSpaces().lowercased()
//        params.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        self.url += "sites/MLA/search?q=\(params)"
        return self
    }
    
    func build() -> String {
        return url
    }
}
