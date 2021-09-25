//
//  SearchBuilder.swift
//  Teste_ML
//
//  Created by Bruna Drago on 25/09/21.
//

import UIKit

struct SearchBuilder {

    // MARK: - Public Functions

    static func build() -> UIViewController {
        let viewController = SearchViewController()
        let interactor = SearchInteractor()
        let presenter = SearchPresenter()
        let router = SearchRouter()

        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController

        return viewController
    }
}
