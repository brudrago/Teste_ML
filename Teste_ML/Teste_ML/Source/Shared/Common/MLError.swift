//
//  MLError.swift
//  Teste_ML
//
//  Created by Bruna Drago on 26/09/21.
//

import Foundation

enum MLError: Error {
    case decodeError
    case networkError
    case invalidProductName
    case invalidData
}

extension MLError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .decodeError:
            return "Desculpe! Encontramos um erro no decode."
        case .networkError:
            return "Desculpe! Encontramos um erro de conexão."
        case .invalidProductName:
            return "Não localizamos seu produto. Tente novamente!"
        case .invalidData:
            return "Desculpe! Algo deu errado , tente novamente!"
        }
    }
}
