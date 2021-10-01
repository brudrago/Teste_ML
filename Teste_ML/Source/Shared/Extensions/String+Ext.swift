//
//  String+Ext.swift
//  Teste_ML
//
//  Created by Bruna Drago on 26/09/21.
//

import Foundation

extension String {

    func removingSpaces() -> String {

        return self.replacingOccurrences(of: " ", with: "")
    }
    
    public var moneyFormat: String {
        return "$\(self.replacingOccurrences(of: ".", with: ","))"
    }
}
