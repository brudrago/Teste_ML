//
//  ProductInfoDetailsBuilder.swift
//  Teste_ML
//
//  Created by Bruna Drago on 25/09/21.
//

import UIKit

struct ProductInfoDetailsBuilder {

    // MARK: - Public Functions

    static func build() -> UIViewController {
        let viewController = ProductInfoDetailsViewController()
        let interactor = ProductInfoDetailsInteractor()
        let presenter = ProductInfoDetailsPresenter()
        let router = ProductInfoDetailsRouter()

        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController

        return viewController
    }
}
