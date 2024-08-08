//
//  CategorySlider.swift
//  Goro
//
//  Created by EG LONGBUI on 2024/08/02.
//

import Foundation
import SwiftUI

struct Category: Identifiable {
    private(set) var id: UUID = .init()
    var categoryName: String
    var categoryIcon: Image
}
