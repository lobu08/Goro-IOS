//
//  LoadingView.swift
//  Goro
//
//  Created by EG LONGBUI on 2024/07/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

#Preview {
    LoadingView()
}
