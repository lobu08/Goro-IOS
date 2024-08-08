//
//  ApiSubject.swift
//  Goro
//
//  Created by EG LONGBUI on 2024/08/06.
//

import Foundation

struct Api: Decodable, Identifiable, Hashable {
    var id: Int
    var title: String
    var content: String
    var author: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case content
        case author
    }
}
