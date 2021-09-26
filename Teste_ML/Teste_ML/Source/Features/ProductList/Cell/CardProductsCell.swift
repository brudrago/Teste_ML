//
//  CardProductsCell.swift
//  Teste_ML
//
//  Created by Bruna Drago on 25/09/21.
//

import UIKit

class CardProductsCell: UITableViewCell {
    
    // MARK: - Identifier
    
    static let identifier: String = String(describing: CardProductsCell.self)
    
    // MARK: - UI Element
    
    private var mainView: UIView = {
        let view = UIView(frame: .zero)
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        return view
    }()
    
    private var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var itemStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        return stack
    }()
    
    private var productNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 2
        label.textColor = .systemYellow
        return label
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 0
        label.textColor = .systemYellow
        return label
    }()

    // MARK: - Initialize
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Function
    
    func setList(product: APIResponse) {
        productNameLabel.text = product.title
        priceLabel.text = String(product.price ?? 0).moneyFormat
        productImageView.load(url: product.thumbnail ?? "")
    }

}

// MARK: - ViewCodeProtocol Extension

extension CardProductsCell: ViewCodeProtocol {
    func setupSubviews() {
        addSubview(mainView)
        mainView.addSubview(productImageView)
        productImageView.addSubview(itemStackView)
        itemStackView.addArrangedSubview(productNameLabel)
        itemStackView.addArrangedSubview(priceLabel)
    }
    
    func setupConstraints() {
        mainView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().inset(15)
        }
        
        productImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        itemStackView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().inset(5)
            make.bottom.equalToSuperview().inset(15)
            make.height.equalTo(80)
        }
    }
    
    func setupComponents() {
        backgroundColor = .systemBackground
    }
}
