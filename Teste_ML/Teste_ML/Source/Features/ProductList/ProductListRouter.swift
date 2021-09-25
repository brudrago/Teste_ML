//
//  ProductListRouter.swift
//  Teste_ML
//
//  Created by Bruna Drago on 25/09/21.
//

import Foundation

protocol ProductListRouterProtocol {

    func proceedToProductInfoDetails(product: ProductListResponse)
}

class ProductListRouter: ProductListRouterProtocol {

    // MARK: - VIP Properties

    weak var viewController: ProductListViewController!

    // MARK: - Public Functions

    func proceedToProductInfoDetails(product: ProductListResponse) {
        let productInfoDetailsViewController = ProductInfoDetailsBuilder.build(product: product)

        viewController.navigationController?
            .pushViewController(productInfoDetailsViewController, animated: true)
    }
}
