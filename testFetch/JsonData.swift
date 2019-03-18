//
//  File.swift
//  testFetch
//
//  Created by ognjen on 2/27/19.
//  Copyright © 2019 ognjen. All rights reserved.
//

import Foundation
import Apollo

public typealias JsonData = [String:Any?]

extension Dictionary: JSONDecodable {
    /// Custom `init` extension so Apollo can decode custom scalar type `JsonData `
    public init(jsonValue value: JSONValue) throws {
        guard let dictionary = value as? Dictionary else {
            throw JSONDecodingError.couldNotConvert(value: value, to: Dictionary.self)
        }
        self = dictionary
    }
}


