//
//  ProductInfoDetailsView.swift
//  Teste_ML
//
//  Created by Bruna Drago on 25/09/21.
//

import UIKit
import SnapKit

class ProductInfoDetailsView: UIView {

    // MARK: - UI Components

    // Put here your ui components

    // MARK: - Private Properties

    private unowned let delegate: ProductInfoDetailsViewDelegate

    // MARK: - Inits

    init(_ delegate: ProductInfoDetailsViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Functions

    // Put here your public functions

    // MARK: - Private Functions

    // Put here your private functions
}

// MARK: - ViewCodeProtocol Extension

extension ProductInfoDetailsView: ViewCodeProtocol {

    func setupSubviews() {
        // Add your components to view
    }

    func setupConstraints() {
        // Create components constraints
    }

    func setupComponents() {
        // Set components delegate and defaults preference
        // E.G.: backgroundColor, registerCellOn, accessibilityIdentifier, addTarget
    }
}
