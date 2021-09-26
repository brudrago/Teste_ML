//
//  NetworkManager.swift
//  Teste_ML
//
//  Created by Bruna Drago on 26/09/21.
//

import Alamofire

typealias NetworkResult<T: Decodable> = ((Result<T?, MLError>) -> Void)

protocol NetworkManagerProtocol {
    
    static func request<T: Decodable>(url: String, completion: @escaping NetworkResult<T>)
}

class NetworkManager: NetworkManagerProtocol {
    
    // MARK: - Inits
    
    init() {}
    
    // MARK: - Public Functions
    
    static func request<T: Decodable>(url: String, completion: @escaping NetworkResult<T>) {
        let request = AF.request(url, method: .get)
        
        request.validate().responseJSON { response in
            switch response.result {
            case .success:
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                  //  decoder.dateDecodingStrategy = .iso8601
                    let data = response.data ?? Data()
                    let result = try decoder.decode(T.self, from: data)
                    completion(.success(result))
                } catch {
                    print("===ERROR:\(error.localizedDescription)")
                    completion(.failure(.decodeError))
                }
            case .failure:
                completion(.failure(.networkError))
            }
        }
    }
}
