//
//  MLEmptyStateView.swift
//  Teste_ML
//
//  Created by Bruna Drago on 25/09/21.
//

import UIKit

class MLEmptyStateView: UIView {
    
    // MARK: - UI Components
    
    private lazy var messageLabel: MLTitleLabel = {
        let label = MLTitleLabel(textAlignment: .center, fontsize: 28)
        label.numberOfLines = 3
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "search-logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(message: String) {
        super.init(frame: .zero)
        messageLabel.text = message
        setupUI()
    }
    
}

// MARK: - ViewCode Protocol

extension MLEmptyStateView: ViewCodeProtocol {
    func setupSubviews() {
        addSubview(messageLabel)
        addSubview(logoImageView)
    }
    
    func setupConstraints() {
        messageLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(100)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(messageLabel.snp.bottom).offset(40)
            make.left.bottom.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
        }
    }
    
    func setupComponents() {
        backgroundColor = .systemBackground
    }
}
