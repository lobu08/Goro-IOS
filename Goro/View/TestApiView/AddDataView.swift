//
//  AddDataView.swift
//  Goro
//
//  Created by EG LONGBUI on 2024/08/07.
//

import SwiftUI

struct AddDataView: View {
    @State private var title: String = ""
    @State private var content: String = ""
    @State private var author: String = ""
    
    var body: some View {
        NavigationView{
            VStack {
                VStack {
                    Text("Title")
                        .frame(maxWidth: 250, alignment: .leading)
                    TextField("Title", text: $title)
                        .padding()
                        .background(Color.black.opacity(0.1))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
                VStack {
                    Text("Content")
                        .frame(maxWidth: 250, alignment: .leading)
                    TextField("Content", text: $content)
                        .padding()
                        .background(Color.black.opacity(0.1))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                VStack {
                    Text("Author")
                        .frame(maxWidth: 250, alignment: .leading)
                    TextField("Author", text: $author)
                        .padding()
                        .background(Color.black.opacity(0.1))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
                Button("Add") {
                    
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddDataView()
}
