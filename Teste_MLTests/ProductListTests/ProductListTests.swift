//
//  ProductListTests.swift
//  Teste_MLTests
//
//  Created by Bruna Drago on 26/09/21.
//

import XCTest
@testable import Teste_ML

class ProductListTests: XCTestCase {
    
    // MARK: - Public Properties
    
    var productWorker: ProductWorkerProtocol!
    
    // MARK: - Test Lifecycle
    
    override func setUp() {
        self.productWorker = ProductWorkerMock()
    }

    // MARK: - Unit Tests

    func testInteractorInitialization() {
        let interactor = ProductListInteractor()
        XCTAssertNotNil(interactor)
    }
    
    func testfetchProducts() { 
        let viewController = build()
        viewController.interactor.fetchProducts()
        XCTAssertTrue(viewController.showLoadingCalled)
        XCTAssertTrue(viewController.dismissLoadingCalled)
    }
    
    func testFetchFollowersFailed() {
        self.productWorker = ProductWorkerMockFailedMock()
        let viewController = build()
        
        viewController.interactor.fetchProducts()
        XCTAssertTrue(viewController.showLoadingCalled)
        XCTAssertTrue(viewController.showAlertCalled)
    }
    
    
    // MARK: - Private Functions
    
    private func build() -> ProductListViewControllerMock {
        let interactor = ProductListInteractor(
            productWorker: productWorker)
        
        let presenter = ProductListPresenter()
        let viewController = ProductListViewControllerMock()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        interactor.product = "Motorola"
        
        return viewController
    }
}

