//
// Amount.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** some description  */

public struct Amount: Codable {

    /** some description  */
    public var value: Double
    public var currency: Currency

    public init(value: Double, currency: Currency) {
        self.value = value
        self.currency = currency
    }


}

