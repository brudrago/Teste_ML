//
//  SearchViewController.swift
//  Teste_ML
//
//  Created by Bruna Drago on 25/09/21.
//

import UIKit

protocol SearchViewControllerProtocol: AnyObject {
    
    func showAlert(title: String, message: String, buttonTitle: String)

    func searchForProducts()
}

class SearchViewController: UIViewController {

    // MARK: - VIP Properties

    var interactor: SearchInteractorProtocol!

    var router: SearchRouterProtocol!

    // MARK: - Private Properties

    private lazy var searchView: SearchView = {
        return SearchView(self)
    }()

    // MARK: - View Lifecycle

    override func loadView() {
        super.loadView()
        self.view = searchView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        createDismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }

    // MARK: - Public Functions

    func showAlert(title: String, message: String, buttonTitle: String) {
      //  presentFVCAlertOnMainThread(title: title , message: message, buttonTitle: buttonTitle)
    }
    
    func searchForProducts() {
      //  router.proceedToFollowerList()
    }
    // MARK: - Private Functions

    private func setupNavigation() {
        navigationController?.isNavigationBarHidden = true
    }
    
    private  func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
}

// MARK: - SearchViewDelegate Extension

extension SearchViewController: SearchViewDelegate {
    
    func didSelectSearchProductsButton(product: String?) {
        
    }

}

// MARK: - SearchViewControllerProtocol Extension

extension SearchViewController: SearchViewControllerProtocol {
    
}
