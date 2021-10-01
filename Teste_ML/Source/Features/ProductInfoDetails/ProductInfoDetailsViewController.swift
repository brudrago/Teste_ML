//
//  ProductInfoDetailsViewController.swift
//  Teste_ML
//
//  Created by Bruna Drago on 25/09/21.
//

import UIKit

protocol ProductInfoDetailsViewControllerProtocol: AnyObject {

    func set(product: APIResponse)
    
    func showDetails(for url: String)
    
    func showAlert(title: String, message: String, buttonTitle: String)
    
}

class ProductInfoDetailsViewController: UIViewController {

    // MARK: - VIP Properties

    var interactor: ProductInfoDetailsInteractorProtocol!

    var router: ProductInfoDetailsRouterProtocol!

    // MARK: - Public Properties

    // Put here your public properties

    // MARK: - Private Properties

    private lazy var productInfoDetailsView: ProductInfoDetailsView = {
        return ProductInfoDetailsView(self)
    }()

    // MARK: - View Lifecycle

    override func loadView() {
        super.loadView()
        self.view = productInfoDetailsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.setData()
    }

    // MARK: - Public Functions

    func showAlert(title: String, message: String, buttonTitle: String) {
        presentAlertOnMainThread(title: title , message: message, buttonTitle: buttonTitle)
    }
    
    // MARK: - Private Functions

    // Put here your private functions
}

// MARK: - ProductInfoDetailsViewDelegate Extension

extension ProductInfoDetailsViewController: ProductInfoDetailsViewDelegate {
    
    func didSelectMoreDetailsButton() {
        interactor.showDetails()
    }
}

// MARK: - ProductInfoDetailsViewControllerProtocol Extension

extension ProductInfoDetailsViewController: ProductInfoDetailsViewControllerProtocol {
    
    func set(product: APIResponse) {
        productInfoDetailsView.setup(product: product)
    }
    
    func showDetails(for url: String) {
        presentSafariViewController(with: url)
    }
}
