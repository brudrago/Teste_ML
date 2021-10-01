//
//  ProductListViewControllerMock.swift
//  Teste_MLTests
//
//  Created by Bruna Drago on 26/09/21.
//


@testable import Teste_ML

class ProductListViewControllerMock: ProductListViewControllerProtocol {
    
    // MARK: - VIP Properties
    
    var interactor: ProductListInteractorProtocol!
    
    // MARK: - Private Properties
    
    private(set) var setCalled = false
    
    private(set) var showAlertCalled = false
    
    private(set) var title: String?
    
    private(set) var message: String?
    
    private(set) var buttonTitle: String?
    
    private(set) var showLoadingCalled = false
    
    private(set) var dismissLoadingCalled = false
    
    private(set) var showEmptyStateCalled = false
    
    private(set) var emptyStateMessage: String?
    
    // MARK: - Public Functions
    
    func set(products: [APIResponse]) {
        self.setCalled = true
    }
    
    func showAlert(title: String, message: String, buttonTitle: String) {
        self.showAlertCalled = true
        self.title = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    func showLoading() {
        self.showLoadingCalled = true
    }
    
    func dismissLoading() {
        self.dismissLoadingCalled = true
    }
    
    func showEmptyState(_ message: String) {
        self.showEmptyStateCalled = true
        self.emptyStateMessage = message
    }
}
