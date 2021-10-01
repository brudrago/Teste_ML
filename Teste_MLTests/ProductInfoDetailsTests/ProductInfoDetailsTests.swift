//
//  ProductInfoDetailsTests.swift
//  Teste_MLTests
//
//  Created by Bruna Drago on 26/09/21.
//

import XCTest
@testable import Teste_ML

class  ProductInfoDetailsTests: XCTestCase {

    // MARK: - Unit Tests

    func testInteractorInitialization() {
        let interactor = ProductInfoDetailsInteractor()
        XCTAssertNotNil(interactor)
    }
    
    func testSetData() {
        guard let product = buildProduct() else { return}
        let viewController = build(product: product)
        viewController.interactor.setData()
        
        XCTAssertTrue(viewController.setCalled)
    }
    
    func testSetDataFailed() {
        guard let product = buildEmptyProduct() else { return}
        let viewController = build(product: product)
        viewController.interactor.setData()
        
        XCTAssertTrue(viewController.setCalled)
    }
    
    func testshowDetails() {
        guard let product = buildProduct() else { return}
        let viewController = build(product: product)
        viewController.interactor.showDetails()
        XCTAssertTrue(viewController.showDetailsCalled)
    }

    
    // MARK: - Private Functions
    
    private func build(product: APIResponse) -> ProductInfoDetailsViewControllerMock {
        let interactor = ProductInfoDetailsInteractor()
        
        let presenter = ProductInfoDetailsPresenter()
        let viewController = ProductInfoDetailsViewControllerMock()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        interactor.product = buildProduct()
        
        return viewController
    }
    
    private func buildProduct() -> APIResponse? {
        return APIResponse(id: "123", siteId: "123", title: "Iphone13", price: 3000, currencyId: "ARS", availableQuantity: 10, soldQuantity: 2, buyingMode: "creditCard", listingTypeId: "", stopTime: "", condition: "", permalink: "", thumbnail: "", acceptsMercadopago: true, categoryId: "1", officialStoreId: 1, catalogProductId: "", tags: [], catalogListing: true)
    }
    
    private func buildEmptyProduct() -> APIResponse? {
        return nil
    }
}
