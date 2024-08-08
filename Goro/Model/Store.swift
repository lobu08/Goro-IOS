//
//  Store.swift
//  Goro
//
//  Created by EG LONGBUI on 2024/08/02.
//

import Foundation
import SwiftUI

struct Store: Identifiable {
    private(set) var id: UUID = .init()
    var storeName: String
    var storeLogo: Image
}
