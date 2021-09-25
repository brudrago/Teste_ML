//
//  SearchViewController.swift
//  Teste_ML
//
//  Created by Bruna Drago on 25/09/21.
//

import UIKit

protocol SearchViewControllerProtocol: AnyObject {

    // Put here your protocol
}

class SearchViewController: UIViewController {

    // MARK: - VIP Properties

    var interactor: SearchInteractorProtocol!

    var router: SearchRouterProtocol!

    // MARK: - Public Properties

    // Put here your public properties

    // MARK: - Private Properties

    private lazy var searchView: SearchView = {
        return SearchView(self)
    }()

    // MARK: - View Lifecycle

    override func loadView() {
        self.view = searchView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Public Functions

    // Put here your public functions

    // MARK: - Private Functions

    // Put here your private functions
}

// MARK: - SearchViewDelegate Extension

extension SearchViewController: SearchViewDelegate {
    
    func didSelectSearchProductsButton(product: String?) {
        
    }

}

// MARK: - SearchViewControllerProtocol Extension

extension SearchViewController: SearchViewControllerProtocol {
    
    // Put here your protocol
}
