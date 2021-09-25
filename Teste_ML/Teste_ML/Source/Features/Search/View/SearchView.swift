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
    
    private lazy var scrollView: UIScrollView = {
        return UIScrollView(frame: .zero)
    }()
    
    private lazy var scrollContent: UIView = {
        let contentView = UIView(frame: .zero)
        contentView.backgroundColor = .clear
        return contentView
    }()
    
    private lazy var searchStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 48
        return stack
    }()
    
    private lazy var logoImageView: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "ml-logo-transparent")
        logo.contentMode = .scaleToFill
        return logo
    }()
    
    private lazy var productTextField: UITextField = {
        let textField = MLTextField()
        textField.placeholder = K.placeholder
        textField.delegate = self
        return textField
    } ()
    
    private lazy var searchProductsButton: UIButton = {
        let button = MLButton(
            backgroundColor: .systemYellow,
            title: K.search)
        return button
    } ()
    
    private lazy var footerView: UIView = {
        let footer = UIView(frame: .zero)
        footer.backgroundColor = .clear
        return footer
    }()
    
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
    
    func getProduct() -> String {
        return productTextField.text ?? ""
    }
    
    // MARK: - Private Functions
    
    @objc
    private func didSelecSearchProductButton(_ button: MLButton) {
        let product = productTextField.text
        delegate.didSelectSearchProductsButton(product: product)
    }
}

// MARK: - ViewCodeProtocol Extension

extension SearchView: ViewCodeProtocol {
    
    func setupSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(scrollContent)
        scrollContent.addSubview(searchStackView)
        searchStackView.addArrangedSubview(logoImageView)
        searchStackView.addArrangedSubview(productTextField)
        scrollContent.addSubview(searchProductsButton)
        scrollContent.addSubview(footerView)
    }
    
    func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.left.right.equalTo(safeAreaLayoutGuide)
            make.top.bottom.equalTo(safeAreaLayoutGuide)
        }
        
        scrollContent.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.left.right.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        
        searchStackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.centerX.equalToSuperview()
            make.height.equalTo(200)
            make.width.equalTo(200)
        }
        
        productTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().inset(50)
            make.height.equalTo(50)
        }
        
        searchProductsButton.snp.makeConstraints { make in
            make.top.equalTo(searchStackView.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().inset(50)
            make.height.equalTo(50)
        }
        
        footerView.snp.makeConstraints { make in
            make.top.equalTo(searchProductsButton.snp.bottom).offset(20)
            make.bottom.equalToSuperview().offset(50)
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().inset(50)
            make.height.equalTo(50)
        }
    }
    
    func setupComponents() {
        backgroundColor = .systemBackground
        
        let searchProductButtonAction = #selector(didSelecSearchProductButton(_:))
        searchProductsButton.addTarget(self, action: searchProductButtonAction, for: .touchUpInside)
    }
}

// MARK: - UITextField Delegate Extension

extension SearchView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let product = productTextField.text
        delegate.didSelectSearchProductsButton(product: product)
        textField.resignFirstResponder()
        textField.text?.removeAll()
        return true
    }
}
