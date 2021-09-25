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

    private lazy var scrollView: UIScrollView = {
        return UIScrollView(frame: .zero)
    }()
    
    private lazy var scrollContent: UIView = {
        let contentView = UIView(frame: .zero)
        contentView.backgroundColor = .clear
        return contentView
    }()
    
    private lazy var containerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    
    private lazy var productNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var productImageView: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "ml-logo")
        logo.contentMode = .scaleToFill
        return logo
    }()
    
    private lazy var detailsLabel: UILabel = {
        let label = UILabel()
        return label
    }()

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
