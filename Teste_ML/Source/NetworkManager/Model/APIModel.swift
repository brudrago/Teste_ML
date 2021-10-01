//
//  APIModel.swift
//  Teste_ML
//
//  Created by Bruna Drago on 26/09/21.
//

import Foundation

struct APIModel : Codable {
    let siteId : String?
    let query : String?
    let results : [APIResponse]?
    let secondaryResults : [String]?
    let relatedResults : [String]?

 
    init(siteId: String, query: String, results: [APIResponse], secondaryResults : [String], relatedResults : [String]) {
        self.siteId = siteId
        self.query = query
        self.results = results
        self.secondaryResults = secondaryResults
        self.relatedResults = relatedResults
    }
}
