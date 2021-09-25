//
//  ProductListBuilder.swift
//  Teste_ML
//
//  Created by Bruna Drago on 25/09/21.
//

import UIKit

struct ProductListBuilder {

    // MARK: - Public Functions

    static func build(_ product: String?) -> UIViewController {
        let viewController = ProductListViewController()
        let interactor = ProductListInteractor()
        let presenter = ProductListPresenter()
        let router = ProductListRouter()

        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        
        interactor.product = product

        return viewController
    }
}
