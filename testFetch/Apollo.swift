//
//  Apollo.swift
//  testFetch
//
//  Created by ognjen on 2/25/19.
//  Copyright © 2019 ognjen. All rights reserved.
//

import Foundation
import Apollo





class Apollo {
    
    // 1
    static let shared = Apollo()
    // 2
    let client: ApolloClient
    
    init() {
        // 3
        client = ApolloClient(url: URL(string: "https://bestproducts.diwanee-serbia.com/graphql/node")!)
    }
    
}
