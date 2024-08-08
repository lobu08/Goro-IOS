//
//  TestCallApiVM.swift
//  Goro
//
//  Created by EG LONGBUI on 2024/08/02.
//

import SwiftUI
import Combine

class PostVM: ObservableObject {
    @Published var inputTitle: String = ""
    @Published var inputContent: String = ""
    @Published var inputAuthor: String = ""
    @Published var responseMessage: String = ""
    @Published var isLoading: Bool = false

    func fetchData() {
        guard let url = URL(string: "") else {
            responseMessage = "Invalid URL"
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: String] = ["input": inputTitle, "input": inputContent, "input": inputAuthor,]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)

        isLoading = true
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let error = error {
                    self?.responseMessage = "Error: \(error.localizedDescription)"
                    return
                }

                guard let data = data,
                      let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                      let message = jsonResponse["message"] as? String else {
                    self?.responseMessage = "Invalid response"
                    return
                }

                self?.responseMessage = message
            }
        }.resume()
    }
}
