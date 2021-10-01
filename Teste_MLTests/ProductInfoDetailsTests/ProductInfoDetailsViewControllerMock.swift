//
//  ProductInfoDetailsViewControllerMock.swift
//  Teste_MLTests
//
//  Created by Bruna Drago on 26/09/21.
//

@testable import Teste_ML

class ProductInfoDetailsViewControllerMock : ProductInfoDetailsViewControllerProtocol {

    // MARK: - VIP Properties
    
    var interactor: ProductInfoDetailsInteractorProtocol!
    
    // MARK: - Private Properties
    
    private(set) var setCalled = false
    
    private(set) var showDetailsCalled = false
    
    private(set) var showAlertCalled = false
    
    private(set) var showLoadingCalled = false
    
    private(set) var dismissLoadingCalled = false
    
    private(set) var url: String?
    
    private(set) var title: String?
    
    private(set) var message: String?
    
    private(set) var buttonTitle: String?
    
    // MARK: - Public Functions
    
    func set(product: APIResponse) {
        self.setCalled = true
    }

    func showDetails(for url: String) {
        self.showDetailsCalled = true
        self.url = url
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
}

