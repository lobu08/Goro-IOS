//
//  Item.swift
//  Goro
//
//  Created by EG LONGBUI on 2024/07/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
