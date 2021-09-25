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
//        guard let username = dataStore.username else { return }
//
//        let followerListViewController = FollowerListBuilder.build(username)
//        followerListViewController.title = username
//
//        viewController.navigationController?
//            .pushViewController(followerListViewController, animated: true)
    }
}
