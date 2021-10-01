//
//  ProductWorkerMock.swift
//  Teste_MLTests
//
//  Created by Bruna Drago on 26/09/21.
//

import Foundation
@testable import Teste_ML

class ProductWorkerMock: ProductWorkerProtocol {
    
    func fetchList(for product: String, completion: @escaping ProductResult) {
        
        let apiResponse = APIResponse(id: "123", siteId: "123", title: "Iphone13", price: 3000, currencyId: "ARS", availableQuantity: 10, soldQuantity: 2, buyingMode: "creditCard", listingTypeId: "", stopTime: "", condition: "", permalink: "", thumbnail: "", acceptsMercadopago: true, categoryId: "1", officialStoreId: 1, catalogProductId: "", tags: [], catalogListing: true)
        
        let apiModel = APIModel(siteId: "123", query: "iphone", results: [apiResponse], secondaryResults: [], relatedResults: [])
        
        completion(.success(apiModel))
    }
}

class ProductWorkerMockFailedMock: ProductWorkerProtocol {
    
    func fetchList(for product: String, completion: @escaping ProductResult) {
        completion(.failure(.decodeError))
    }
}
