//
//  SearchView.swift
//  Teste_ML
//
//  Created by Bruna Drago on 25/09/21.
//

import UIKit
import SnapKit

class SearchView: UIView {

    // MARK: - UI Components

    // Put here your ui components

    // MARK: - Private Properties

    private unowned let delegate: SearchViewDelegate

    // MARK: - Inits

    init(_ delegate: SearchViewDelegate) {
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

extension SearchView: ViewCodeProtocol {

    func setupSubviews() {
        // Add your components to view
    }

    func setupConstraints() {
        // Create components constraints
    }

    func setupComponents() {
        backgroundColor = .cyan
    }
}
