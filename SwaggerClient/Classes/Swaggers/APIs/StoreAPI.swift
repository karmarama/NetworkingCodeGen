//
// StoreAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Networking
import Combine

protocol StoreAPIRepository { 
    func deleteOrder(orderId: String) -> Future<Networking.Empty, Error>
    func getInventory() -> Future<[String:Int], Error>
    func getOrderById(orderId: Int64) -> Future<Order, Error>
    func placeOrder(body: Order) -> Future<Order, Error>
}

extension Repository: StoreAPIRepository {
    func deleteOrder(orderId: String) -> Future<Networking.Empty, Error> {
        let resource = StoreAPI.deleteOrderResource(orderId: orderId) 
        return webservice.future(for: resource)
    }
    
    func getInventory() -> Future<[String:Int], Error> {
        let resource = StoreAPI.getInventoryResource() 
        return webservice.future(for: resource)
    }
    
    func getOrderById(orderId: Int64) -> Future<Order, Error> {
        let resource = StoreAPI.getOrderByIdResource(orderId: orderId) 
        return webservice.future(for: resource)
    }
    
    func placeOrder(body: Order) -> Future<Order, Error> {
        let resource = StoreAPI.placeOrderResource(body: body) 
        return webservice.future(for: resource)
    }
    
}


open class StoreAPI {

    /**
     Delete purchase order by ID
     - DELETE /store/order/{orderId}
     - For valid response try integer IDs with value < 1000. Anything above 1000 or nonintegers will generate API errors
     - parameter orderId: (path) ID of the order that needs to be deleted 

     - returns: Resource<Networking.Empty,Networking.Empty> 
     */
    open class func deleteOrderResource(orderId: String) -> Resource<Networking.Empty,Networking.Empty> {
        var path = "/store/order/{orderId}"
        let orderIdPreEscape = "\(orderId)"
        let orderIdPostEscape = orderIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{orderId}", with: orderIdPostEscape, options: .literal, range: nil)
        
        return Resource(endpoint: path, 
                queryParameters: [],
                method: HTTP.Method(string: "DELETE"), 
                body: nil,
                decoder: JSONDecoder()) 
          
    }


    /**
     Returns pet inventories by status
     - GET /store/inventory
     - Returns a map of status codes to quantities
     - API Key:
       - type: apiKey api_key 
       - name: api_key
     - examples: [{contentType=application/json, example={
  "key" : 0
}}]

     - returns: Resource<Networking.Empty,[String:Int]> 
     */
    open class func getInventoryResource() -> Resource<Networking.Empty,[String:Int]> {
        let path = "/store/inventory"
        
        return Resource(endpoint: path, 
                queryParameters: [],
                method: HTTP.Method(string: "GET"), 
                body: nil,
                decoder: JSONDecoder()) 
          
    }


    /**
     Find purchase order by ID
     - GET /store/order/{orderId}
     - For valid response try integer IDs with value <= 5 or > 10. Other values will generated exceptions
     - examples: [{contentType=application/json, example={
  "petId" : 6,
  "quantity" : 1,
  "id" : 0,
  "shipDate" : "2000-01-23T04:56:07.000+00:00",
  "complete" : false,
  "status" : "placed"
}}]
     - parameter orderId: (path) ID of pet that needs to be fetched 

     - returns: Resource<Networking.Empty,Order> 
     */
    open class func getOrderByIdResource(orderId: Int64) -> Resource<Networking.Empty,Order> {
        var path = "/store/order/{orderId}"
        let orderIdPreEscape = "\(orderId)"
        let orderIdPostEscape = orderIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{orderId}", with: orderIdPostEscape, options: .literal, range: nil)
        
        return Resource(endpoint: path, 
                queryParameters: [],
                method: HTTP.Method(string: "GET"), 
                body: nil,
                decoder: JSONDecoder()) 
          
    }


    /**
     Place an order for a pet
     - POST /store/order
     - examples: [{contentType=application/json, example={
  "petId" : 6,
  "quantity" : 1,
  "id" : 0,
  "shipDate" : "2000-01-23T04:56:07.000+00:00",
  "complete" : false,
  "status" : "placed"
}}]
     - parameter body: (body) order placed for purchasing the pet 

     - returns: Resource<Order,Order> 
     */
    open class func placeOrderResource(body: Order) -> Resource<Order,Order> {
        let path = "/store/order"
        
        return Resource(endpoint: path, 
                queryParameters: [],
                method: HTTP.Method(string: "POST"), 
                body: HTTP.Body(data: body, contentType: JSONContentType()),
                decoder: JSONDecoder()) 
          
    }

}
