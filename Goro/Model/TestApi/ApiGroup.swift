//
//  ApiGroup.swift
//  Goro
//
//  Created by EG LONGBUI on 2024/08/06.
//

import Foundation

struct ApiGroup: Decodable {
    var apis: [Api]
    
    enum CodingKeys: String, CodingKey {
        case apis = "data"
    }
}
