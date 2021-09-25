//
//  ProductListViewDelegate.swift
//  Teste_ML
//
//  Created by Bruna Drago on 25/09/21.
//

import Foundation

protocol ProductListViewDelegate: AnyObject {

    func didSelectProduct(product:ProductListResponse)
}
