//
//  ProductListViewController.swift
//  Teste_ML
//
//  Created by Bruna Drago on 25/09/21.
//

import UIKit

protocol ProductListViewControllerProtocol: AnyObject {

    // Put here your protocol
}

class ProductListViewController: UIViewController {

    // MARK: - VIP Properties

    var interactor: ProductListInteractorProtocol!

    var router: ProductListRouterProtocol!

    // MARK: - Public Properties

    // Put here your public properties

    // MARK: - Private Properties

    private lazy var productListView: ProductListView = {
        return ProductListView(self)
    }()

    // MARK: - View Lifecycle

    override func loadView() {
        super.loadView()
        self.view = productListView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Public Functions

    // Put here your public functions

    // MARK: - Private Functions

    // Put here your private functions
}

// MARK: - ProductListViewDelegate Extension

extension ProductListViewController: ProductListViewDelegate {
    
    func didSelectProduct(product: ProductListResponse) {
        
    }
}

// MARK: - ProductListViewControllerProtocol Extension

extension ProductListViewController: ProductListViewControllerProtocol {
    
    // Put here your protocol
}
