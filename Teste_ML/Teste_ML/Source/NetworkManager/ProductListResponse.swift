//
//  ProductListResponse.swift
//  Teste_ML
//
//  Created by Bruna Drago on 25/09/21.
//

import Foundation

struct ProductListResponse: Codable {
    let siteID, countryDefaultTimeZone, query: String
    let paging: Paging
    
    enum CodingKeys: String, CodingKey {
        case siteID = "site_id"
        case countryDefaultTimeZone = "country_default_time_zone"
        case query, paging
    }
}

// MARK: - Paging
struct Paging: Codable {
    let total, primaryResults, offset, limit: Int

    enum CodingKeys: String, CodingKey {
        case total
        case primaryResults = "primary_results"
        case offset, limit
    }
}

struct Results: Decodable {
    let results: [Products]
}

struct Products: Decodable {
    let id: String?
    let siteId: String?
    let title: String?
    let sellers: Seller?
    let price: Int? //Double
   // let prices :[Price]?
    let currencyId: String?
    let availabeQuantity: String?
    let soldQuantity: Int?
    let permalink: String?
    let thumbnail : String?
    let acceptsMercadopago: Bool?
    
//    enum CodingKeys: String, CodingKey {
//        case id
//        case siteId = "site_id"
//        case title
//        case price
//        case currencyId = "currency_id"
//        case availableQuantity = "available_quantity"
//        case soldQuantity = "sold_quantity"
//        case acceptsMercadopago = "accepts_mercadopago"
//    }
    
    init(id:String,
         siteId: String,
         title: String,
         sellers: Seller,
         price: Int,
         currencyId: String,
         availabeQuantity: String,
         soldQuantity: Int,
         permalink: String,
         thumbnail : String,
         acceptsMercadopago: Bool) {
        self.id = id
        self.siteId = siteId
        self.title = title
        self.sellers = sellers
        self.price = price
        self.currencyId = currencyId
        self.availabeQuantity = availabeQuantity
        self.soldQuantity = soldQuantity
        self.permalink = permalink
        self.thumbnail = thumbnail
        self.acceptsMercadopago = acceptsMercadopago
    }
}

struct Seller: Codable {
    let id, powerSellerStatus: Int
    let cardealer, realStateAgency: Bool
   // let tags: [String]

    enum CodingKeys: String, CodingKey {
        case id
        case powerSellerStatus = "power_seller_status"
        case cardealer = "car_dealer"
        case realStateAgency = "real_estate_agency"
    }
}

//struct Price: Codable {
//    let id, type, currencyId:  String
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case type
//        case currencyId = "currency_id"
//    }
//}
