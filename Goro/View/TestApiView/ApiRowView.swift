//
//  ApiRowView.swift
//  Goro
//
//  Created by EG LONGBUI on 2024/08/07.
//

import SwiftUI

struct ApiRowView: View {
    var event: Api
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(event.title)
                .font(.headline)
            
            Text(event.content)
                .font(.body)
                .lineLimit(2)
            
            Text(event.author)
                .font(.subheadline)
        }
    }
}
