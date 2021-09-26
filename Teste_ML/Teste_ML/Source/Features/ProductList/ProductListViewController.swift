//
//  ProductListViewController.swift
//  Teste_ML
//
//  Created by Bruna Drago on 25/09/21.
//

import UIKit

protocol ProductListViewControllerProtocol: AnyObject {

    func set(products: [APIResponse])
    
    func showAlert(title: String, message: String, buttonTitle: String)
    
    func showLoading()
    
    func dismissLoading()
    
    func showEmptyState(_ message: String)
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
        interactor.fetchProducts()
    }

    // MARK: - Public Functions

    func showAlert(title: String, message: String, buttonTitle: String) {
        presentAlertOnMainThread(title: title , message: message, buttonTitle: buttonTitle)
    }
    
    func showLoading() {
      //  startLoading()
    }
    
    func dismissLoading() {
      //  stopLoading()
    }
    
    func showEmptyState(_ message: String) {
        showEmptyStateView(with: message, in: self.view)
    }

    // MARK: - Private Functions

    // Put here your private functions
}

// MARK: - ProductListViewDelegate Extension

extension ProductListViewController: ProductListViewDelegate {
    
    func didSelectProduct(product: APIResponse) {
        
    }
}

// MARK: - ProductListViewControllerProtocol Extension

extension ProductListViewController: ProductListViewControllerProtocol {
    
    func set(products: [APIResponse]) {
        productListView.set(products: products)
    }
}
