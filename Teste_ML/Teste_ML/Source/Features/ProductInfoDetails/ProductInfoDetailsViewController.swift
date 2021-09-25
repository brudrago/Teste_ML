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

    private lazy var featureView: ProductInfoDetailsView = {
        return ProductInfoDetailsView(self)
    }()

    // MARK: - View Lifecycle

    override func loadView() {
        self.view = featureView
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

    func didDoSomething() {
        // Put here your view delegate action
    }
}

// MARK: - ProductInfoDetailsViewControllerProtocol Extension

extension ProductInfoDetailsViewController: ProductInfoDetailsViewControllerProtocol {
    
    // Put here your protocol
}
