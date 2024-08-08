//
//  ContentView.swift
//  Goro
//
//  Created by EG LONGBUI on 2024/07/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var userName: String = ""
    @State private var password: String = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    @State private var isSubmitting: Bool = false
    @State private var responseMessage: String = ""
    @State private var currentIndex = 0
    

    @State private var selectedIndex: Int = 0
    
    
    @StateObject private var imageSliderViewModel = ImageSliderViewModel(sliderID: 0, data: [
        ImageSlider(color: .gray, image: Image("Logo")),
        ImageSlider(color: .gray, image: Image("Logo")),
        ImageSlider(color: .gray, image: Image("Logo"))
    ])
    @StateObject private var categorySliderViewModel = ImageSliderViewModel(sliderID: 1, data: [
        Category(categoryName: "Sữa", categoryIcon: Image("Logo")),
        Category(categoryName: "Sữa", categoryIcon: Image("Logo")),
        Category(categoryName: "Sữa", categoryIcon: Image("Logo")),
        Category(categoryName: "Sữa", categoryIcon: Image("Logo")),
        Category(categoryName: "Sữa", categoryIcon: Image("Logo")),
        Category(categoryName: "Sữa", categoryIcon: Image("Logo")),

        Category(categoryName: "Sữa", categoryIcon: Image("Logo")),

        Category(categoryName: "Sữa", categoryIcon: Image("Logo"))
    ])
    @StateObject private var storeSliderViewModel = ImageSliderViewModel(sliderID: 2, data: [
        Store(storeName: "Viet", storeLogo: Image("Logo")),
        Store(storeName: "Viet", storeLogo: Image("Logo")),
        Store(storeName: "Viet", storeLogo: Image("Logo")),
        Store(storeName: "Viet", storeLogo: Image("Logo"))
    ])
    
    var body: some View {
        ZStack {
            Color(.white)
            VStack (alignment: .leading) {
                headerBar()
                    .padding(.horizontal)
                
                ScrollView() {
                    Search()
                    
                    Address()
                    
                    VStack {
                        ImageSliderView(ImageSliderVM: imageSliderViewModel) { img in
                            Image("Logo")
                                .resizable()
                                .frame(width: 380, height: 150)
                        }
                    }
                    
                    VStack {
                        Text(". Categories .")
                            .padding()
                            .font(.title)
                            .italic()
                    }
                    .frame(maxWidth: .infinity)
                    
                    //                ScrollView(.horizontal, showsIndicators: true) {
                    //                    HStack () {
                    //                        ForEach(0 ..< categories.count) { i in
                    //                            CategoryView(isActive: i == selectedIndex, text: categories[i ])
                    //                                .onTapGesture {
                    //                                    selectedIndex = i
                    //                                }
                    //                        }
                    //                    }
                    //                    .padding()
                    //                    .frame(width: 394)
                    //                }
                    VStack {
                        ImageSliderView(ImageSliderVM: categorySliderViewModel) {img in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.yellow)
                                .frame(width: 50, height:60)
                                
                        }
                        
                    }
                    
                    VStack {
                        Text("Stores..")
                            .padding()
                            .font(.title)
                            .italic()
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    VStack {
                        ImageSliderView(ImageSliderVM: storeSliderViewModel) {img in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.yellow)
                                .frame(width: 160, height: 150)
                        }
                        }
                    }
                }
            }
        }
    }

    
    //        VStack {
    //            TextField("Nhập UserName", text: $userName)
    //                .padding()
    //                .textFieldStyle(RoundedBorderTextFieldStyle())
    //
    //            Button(action: submitForm) {
    //                Text(isSubmitting ? "Submitting..." : "Submit")
    //            }
    //            .padding()
    //            .disabled(isSubmitting)
    //
    //
    //            if !responseMessage.isEmpty {
    //                Text(responseMessage)
    //                    .padding()
    //            }
    //
    //        }
    //        .padding()
    //    }
    //
    //    func submitForm() {
    //        isSubmitting = true
    //        let url = URL(string: "")!
    //        var request = URLRequest(url: url)
    //        request.httpMethod = "POST"
    //        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    //
    //        let body = [
    //            "userName": userName
    //        ]
    //
    //        do {
    //            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
    //        } catch {
    //            print("Error encoding JSON: \(error)")
    //            isSubmitting = false
    //            return
    //        }
    //
    //        let task = URLSession.shared.dataTask(with: request) { data, response, error in
    //            isSubmitting = false
    //
    //            if let error = error {
    //                DispatchQueue.main.async {
    //                    responseMessage = "Error: \(error.localizedDescription)"
    //                }
    //                return
    //            }
    //
    //            guard let data = data else {
    //                DispatchQueue.main.async {
    //                    responseMessage = "Api error"
    //                }
    //                return
    //            }
    //
    //            do {
    //                if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
    //                   let message = jsonResponse["message"] as? String {
    //                    DispatchQueue.main.async {
    //                        self.responseMessage = message
    //                    }
    //                } else {
    //                    DispatchQueue.main.async {
    //                        responseMessage = "Reponse Error"
    //                    }
    //                }
    //            } catch {
    //                DispatchQueue.main.async {
    //                    responseMessage = "JSON error: \(error.localizedDescription)"
    //                }
    //            }
    //        }
    //
    //        task.resume()
    //    }
    //}
    //    //    @StateObject var locationManager = LocationManager()
    //    //   var weatherManager = WeatherManager()
    //    //  @State var weather: ResponseBody?
    //
    // //   var body: some View {
    // //       VStack {
    // //           if let location = locationManager.location {
    // //               if let weather = weather {
    // //                   Text("Weather data fetched")
    // //               } else {
    // //                   LoadingView()
    // //               }
    // //           } else {
    // //               if locationManager.isLoading {
    // //                   LoadingView()
    // //               } else {
    // //                   WelComeView()
    // //                       .environmentObject(locationManager)
    //    //                 }
    //    //         }
    //    //   }
    //    //           .background(Color(hue: 0.606, saturation: 0.809, brightness: 0.275))
    //    //            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    //    //  }
    //
    //    //
    

    #Preview {
        ContentView()
            .modelContainer(for: Item.self, inMemory: true)
    }
    

struct headerBar: View {
    var body: some View {
        HStack (spacing: 0){
            Image("Logo")
                .resizable()
                .frame(width: 80, height: 35)
                .padding()
            Spacer()
            Image(systemName: "house.fill")
                .padding()
            Image(systemName: "cart.fill")
                .padding()
            Image(systemName: "person.fill")
                .padding()
            
            
        }
    }
}

struct Search: View {
    @State private var search: String = ""
    var body: some View {
        HStack {
            TextField ("Search on Goro", text: $search) {
                
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            Image(systemName: "magnifyingglass")
                .padding(.trailing)
        }
        .padding(.horizontal)
        .border(Color.black)
        .frame(maxWidth: 350)
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

struct Address: View {
    var body: some View {
        HStack {
            Image(systemName: "mappin.and.ellipse")
                .padding(.trailing)
            Text("Delivery address: Saitama, koshigaya, anke 2-2-2")
                .font(.caption)
            Image(systemName: "slider.horizontal.3")
                .padding(.leading)
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    
    let isActive: Bool
    let text: String
    var body: some View {
            VStack(alignment: .leading, spacing : 0) {
                Text(text)
                    .font(.system(size: 18))
                    .foregroundColor(isActive ? Color.black: Color.blue)
                    .fontWeight(.medium)
                if (isActive) {
                    Color.black
                        .frame(width: 30, height: 2)
                        .clipShape(Capsule())
                }
            }
            .padding(.trailing)
        }
    }
