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
        imageView.contentMode = .scaleAspectFill
      //  imageView.image = UIImage(named: "mercado-livre")
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
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = .blue
        return label
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = .white
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
    
    func set(product: ProductViewModel) {
        productNameLabel.text = product.title
       // productImageView.load(url: product.thumbnail)
    }
    
    func setList(product: APIResponse) {
        productNameLabel.text = product.title
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
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().inset(15)
            make.height.equalTo(40)
        }
        
//        productNameLabel.snp.makeConstraints { make in
//            make.left.equalToSuperview().offset(15)
//            make.right.equalToSuperview().inset(15)
//          //  make.bottom.equalToSuperview().inset(15)
//        }
//
//        priceLabel.snp.makeConstraints { make in
//            make.left.equalToSuperview().offset(15)
//            make.right.equalToSuperview().inset(15)
//            make.bottom.equalToSuperview().inset(15)
//        }
    }
    
    func setupComponents() {
        backgroundColor = .systemBackground
    }
}
