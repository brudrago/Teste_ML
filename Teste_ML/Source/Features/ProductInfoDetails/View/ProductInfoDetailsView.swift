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
    
    private lazy var productImageView: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "ml-logo")
        logo.contentMode = .scaleAspectFit
        return logo
    }()
    
    private lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var detailsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .tertiaryLabel
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var moreDetailsButton: UIButton = {
        let button = MLButton(
            backgroundColor: .systemYellow,
            title: K.goToSite)
        return button
    } ()
    
    private lazy var footerView: UIView = {
        let footer = UIView(frame: .zero)
        footer.backgroundColor = .clear
        return footer
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

    func setup(product: APIResponse) {
        productImageView.load(url: product.thumbnail ?? "")
        productNameLabel.text = product.title
        detailsLabel.text = String(product.price ?? 0).moneyFormat
    }

    // MARK: - Private Functions

    @objc
    private func didSelectmoreDetailsButton(_ button: MLButton) {
        delegate.didSelectMoreDetailsButton()
    }
}

// MARK: - ViewCodeProtocol Extension

extension ProductInfoDetailsView: ViewCodeProtocol {

    func setupSubviews() {
       addSubview(scrollView)
        scrollView.addSubview(scrollContent)
        scrollContent.addSubview(containerStackView)
        containerStackView.addArrangedSubview(productImageView)
        containerStackView.addArrangedSubview(productNameLabel)
        containerStackView.addArrangedSubview(detailsLabel)
        scrollContent.addSubview(moreDetailsButton)
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
        
        containerStackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        productImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.right.equalToSuperview().inset(15)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(300)
        }
        
        productNameLabel.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(20)
            make.right.equalToSuperview().inset(15)
            make.left.equalToSuperview().offset(15)
        }
        
        detailsLabel.snp.makeConstraints { make in
            make.top.equalTo(productNameLabel.snp.bottom).offset(15)
            make.right.equalToSuperview().inset(15)
            make.left.equalToSuperview().offset(15)
        }
 
        moreDetailsButton.snp.makeConstraints { make in
            make.top.equalTo(containerStackView.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().inset(50)
            make.height.equalTo(50)
        }
        
        footerView.snp.makeConstraints { make in
            make.top.equalTo(moreDetailsButton.snp.bottom).offset(20)
            make.bottom.equalToSuperview().offset(50)
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().inset(50)
            make.height.equalTo(50)
        }
        
    }

    func setupComponents() {
        backgroundColor = .systemBackground
        
        let moreDetailsButtonButtonAction = #selector(didSelectmoreDetailsButton(_:))
        moreDetailsButton.addTarget(self, action: moreDetailsButtonButtonAction, for: .touchUpInside)
    }
}
