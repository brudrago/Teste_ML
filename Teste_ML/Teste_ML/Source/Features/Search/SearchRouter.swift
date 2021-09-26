//
//  SearchRouter.swift
//  Teste_ML
//
//  Created by Bruna Drago on 25/09/21.
//

import Foundation

protocol SearchRouterProtocol {

    func proceedToProductsList()
}

protocol SearchDataPassingProtocol {
    
    var dataStore: SearchDataStoreProtocol! { get }
}

class SearchRouter: SearchRouterProtocol {

    // MARK: - VIP Properties

    weak var viewController: SearchViewController!
    
    var dataStore: SearchDataStoreProtocol!

    // MARK: - Public Functions

    func proceedToProductsList() {
        guard let product = dataStore.product else { return }
        
        print("====ROUTER:\(product)")

        let productListViewController = ProductListBuilder.build(product)

        viewController.navigationController?
            .pushViewController(productListViewController , animated: true)
    }
}
