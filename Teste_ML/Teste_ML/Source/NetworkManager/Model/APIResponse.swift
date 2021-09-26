//
//  APIResponse.swift
//  Teste_ML
//
//  Created by Bruna Drago on 26/09/21.
//

import Foundation

struct APIResponse: Codable {
    let id : String?
    let siteId : String?
    let title : String?
    let price : Double?
    let currencyId : String?
    let availableQuantity : Int?
    let soldQuantity : Int?
    let buyingMode : String?
    let listingTypeId : String?
    let stopTime : String?
    let condition : String?
    let permalink : String?
    let thumbnail : String?
    let acceptsMercadopago : Bool?
    let categoryId : String?
    let officialStoreId : Int?
    let catalogProductId : String?
    let tags : [String]?
    let catalogListing : Bool?
    
    init(id: String,
         siteId: String,
         title: String,
         price: Double,
         currencyId: String,
         availableQuantity:Int,
         soldQuantity:Int,
         buyingMode:String,
         listingTypeId:String,
         stopTime:String,
         condition:String,
         permalink:String,
         thumbnail:String,
         acceptsMercadopago:Bool,
         categoryId:String,
         officialStoreId:Int,
         catalogProductId:String,
         tags:[String],
         catalogListing:Bool){
        
        self.id = id
        self.siteId = siteId
        self.title = title
        self.price = price
        self.currencyId = currencyId
        self.availableQuantity = availableQuantity
        self.soldQuantity = soldQuantity
        self.buyingMode = buyingMode
        self.listingTypeId = listingTypeId
        self.stopTime = stopTime
        self.condition = condition
        self.permalink = permalink
        self.thumbnail = thumbnail
        self.acceptsMercadopago = acceptsMercadopago
        self.categoryId = categoryId
        self.officialStoreId = officialStoreId
        self.catalogProductId = catalogProductId
        self.tags = tags
        self.catalogListing = catalogListing
        
    }
}
