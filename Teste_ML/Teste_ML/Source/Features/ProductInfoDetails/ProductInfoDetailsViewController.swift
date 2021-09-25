//
//  ProductInfoDetailsViewController.swift
//  Teste_ML
//
//  Created by Bruna Drago on 25/09/21.
//

import UIKit

protocol ProductInfoDetailsViewControllerProtocol: AnyObject {

    // Put here your protocol
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
    }

    // MARK: - Public Functions

    // Put here your public functions

    // MARK: - Private Functions

    // Put here your private functions
}

// MARK: - ProductInfoDetailsViewDelegate Extension

extension ProductInfoDetailsViewController: ProductInfoDetailsViewDelegate {
    
}

// MARK: - ProductInfoDetailsViewControllerProtocol Extension

extension ProductInfoDetailsViewController: ProductInfoDetailsViewControllerProtocol {
    
    // Put here your protocol
}
