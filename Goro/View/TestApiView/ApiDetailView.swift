//
//  ApiDetail.swift
//  Goro
//
//  Created by EG LONGBUI on 2024/08/07.
//

import Foundation
import SwiftUI

struct ApiDetailView: View {
    var event: Api
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(event.title)
                .font(.title)
            
            Text(event.content)
            
            Text("By \(event.author)")
                .font(.caption)
        }
        .padding()
        .navigationTitle(event.title)
    }
}
