//
//  LoginView.swift
//  Goro
//
//  Created by EG LONGBUI on 2024/07/23.
//

import SwiftUI
import CoreLocationUI

struct LoginView: View {
    @State private var userName: String = ""
    @State private var password: String = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false

    var body: some View {
        NavigationView {
            ZStack {
                Color.black.opacity(0.05).ignoresSafeArea()

                VStack {
                    Spacer()
                    
                    Image("Logo")
                        .resizable()
                        .frame(width: 100, height: 40)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Spacer()
                        .frame(height: 50)

                    VStack(alignment: .center, spacing: 20) {
                        Text("Đăng nhập")
                            .foregroundColor(.white)
                            .font(.title.bold())
                            .padding()

                        VStack(spacing: 2) {
                            Text("Tài khoản")
                                .frame(maxWidth: 250, alignment: .leading)
                            TextField("Nhập Username", text: $userName)
                                .padding()
                                .background(Color.black.opacity(0.1))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .frame(width: 250)

                        VStack(spacing: 2) {
                            Text("Mật khẩu")
                                .frame(maxWidth: 250, alignment: .leading)
                            SecureField("Nhập Password", text: $password)
                                .padding()
                                .background(Color.black.opacity(0.1))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .frame(width: 250)

                        HStack{
                            
                            NavigationLink(destination: ContentView()) {
                                Text("Login")
                                    .font(.title)
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            NavigationLink(destination: TestApiView()) {
                                Text("Get Api")
                                    .font(.title)
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding()
                    .background(Color.black.opacity(0.2))
                    .cornerRadius(10)
                    .frame(width: 320)

                    Spacer()
                }
                .padding()
            }
        }
    }
}

#Preview {
    LoginView()
}
