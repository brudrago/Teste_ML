//
//  MLAlert.swift
//  Teste_ML
//
//  Created by Bruna Drago on 25/09/21.
//

import UIKit

protocol MLAlertViewDelegate: AnyObject {
    
    func dismissVC()
}

class MLAlertView: UIView {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.cgColor
        view.backgroundColor = .systemBackground
        return view
    } ()
    
    private lazy var titleLabel: UILabel = {
        let label = MLTitleLabel(textAlignment: .center, fontsize: 20)
        return label
    } ()
    
    private lazy var bodyLabel: UILabel = {
        let label = MLBodyLabel(textAlignment: .center)
        label.numberOfLines = 4
        return label
    } ()
    
    private lazy var actionButton: UIButton = {
        let button = MLButton(
            backgroundColor: .systemPink,
            title: buttonTitle ?? "OK")
        button.addTarget(self, action: #selector(actionButtontapped), for: .touchUpInside)
        return button
    } ()
    
    private unowned let delegate: MLAlertViewDelegate?
    
    // MARK: - Public Properties
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    // MARK: - Inits
    
    init(_ delegate: MLAlertViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Functions
    
    func set(title: String?, message: String?, buttonTitle: String?) {
        titleLabel.text = title
        bodyLabel.text = message
        actionButton.setTitle(buttonTitle, for: .normal)
    }
    
    // MARK: - Private Functions
    
    @objc
    private func actionButtontapped() {
        delegate?.dismissVC()
    }
}

// MARK: - ViewCodeProtocol Extensions

extension MLAlertView: ViewCodeProtocol {
    
    func setupSubviews() {
        addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(actionButton)
        containerView.addSubview(bodyLabel)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(280)
            make.height.equalTo(220)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(28)
        }
        
        actionButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(44)
        }
        
        bodyLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.bottom.equalTo(actionButton.snp.top).offset(-12)
        }
    }
    
    func setupComponents() {
        backgroundColor = UIColor.black.withAlphaComponent(0.75)
    }
}
