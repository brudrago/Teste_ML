//
//  SearchTests.swift
//  Teste_MLTests
//
//  Created by Bruna Drago on 26/09/21.
//

import XCTest
@testable import Teste_ML

class SearchTests: XCTestCase {

    // MARK: - Unit Tests
    
    func testInteractorInitialization() {
        let interactor = SearchInteractor()
        XCTAssertNotNil(interactor)
    }
    
    func testValidadeSucceed() {
        let product = "iphone"
        let viewController = build()
        viewController.interactor.validate(product)
        
        XCTAssertNotNil(product)
        XCTAssertTrue(viewController.searchForProductsCalled)
        XCTAssertNotEqual(product, "motorola")
    }
    
    func testValidadeFailed() {
        let viewController = build()
        viewController.interactor.validate("")
        XCTAssertTrue(viewController.showAlertCalled)
        
        viewController.interactor.validate("a")
        XCTAssertTrue(viewController.showAlertCalled)
    }
    
    // MARK: - Private Functions
    
    private func build() -> SearchViewControllerMock {
        let interactor = SearchInteractor()
        
        let presenter = SearchPresenter()
        let viewController = SearchViewControllerMock()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
}
