//
// Tag.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** A tag for a pet */

public struct Tag: Codable {

    public var _id: Int64?
    public var name: String?

    public init(_id: Int64?, name: String?) {
        self._id = _id
        self.name = name
    }
    public enum CodingKeys: String, CodingKey { 
        case _id = "id"
        case name
    }

}

extension Tag: Fakeable {

    static var defaultFakeValue: Tag { 
        return Tag.makeFake()
    }
  
    static func makeFake(
                    _id: Int64? = .fake(), 
                    name: String? = .fake()
                    ) -> Tag { 
     return Tag(_id: _id,
            name: name)
    }
}

