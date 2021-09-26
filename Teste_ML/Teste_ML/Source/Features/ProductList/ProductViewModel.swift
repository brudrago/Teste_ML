//
//  ProductListViewModel.swift
//  Teste_ML
//
//  Created by Bruna Drago on 26/09/21.
//

import Foundation


struct ProductListViewModel {
    
    let products: [ProductViewModel]
}

struct ProductViewModel {
    
    let title: String
    
    let price: Double
    
    let currency: String
    
    let availableQuantity: Int
    
    let soldQuantity: Int
    
    let buyingMode: String
    
    let listingTypeId: String
    
    let stopTime: String
    
    let condition: String
    
    let permalink: String
    
    let thumbnail: String
    
    let acceptsMercadopago: Bool
    
    let categoryId: String
}
