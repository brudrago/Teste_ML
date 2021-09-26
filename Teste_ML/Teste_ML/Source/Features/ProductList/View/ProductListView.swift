//
//  ProductListView.swift
//  Teste_ML
//
//  Created by Bruna Drago on 25/09/21.
//

import UIKit
import SnapKit

class ProductListView: UIView {

    // MARK: - UI Components

    private lazy var tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    // MARK: - Private Properties

    weak var delegate: ProductListViewDelegate?
    
    private var products:[APIResponse] = []

    // MARK: - Inits

    init(_ delegate: ProductListViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Functions

    func set(products: [APIResponse]) {
        self.products = products
        tableView.reloadData()
    }

    // MARK: - Private Functions

    // Put here your private functions
}

// MARK: - ViewCodeProtocol Extension

extension ProductListView: ViewCodeProtocol {

    func setupSubviews() {
        addSubview(tableView)
    }

    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
    }

    func setupComponents() {
        backgroundColor = .systemBackground
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CardProductsCell.self, forCellReuseIdentifier: CardProductsCell.identifier)
    }
}

// MARK: - UITableViewDelegate Extension

extension  ProductListView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

// MARK: - UITableViewDataSource Extension

extension  ProductListView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = CardProductsCell.identifier
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? CardProductsCell
        else { return UITableViewCell() }
       
      //  cell.set(product: products[indexPath.row])
        cell.setList(product: products[indexPath.row])
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemSelected = products[indexPath.row]
        delegate?.didSelectProduct(product: itemSelected)
    }
}
