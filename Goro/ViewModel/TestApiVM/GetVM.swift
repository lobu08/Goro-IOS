//
//  TestGetApiVM.swift
//  Goro
//
//  Created by EG LONGBUI on 2024/08/06.
//

import Foundation

final class GetVM: ObservableObject {
    @Published var eventApi: [Api] = []
    @Published var isShowIndicator = false
    @Published var error: ApiError?
    @Published var isShowAlert = false
    
    private let fetcher = GetApiService()
    
    func fetchEventData() {
        Task { @MainActor in
            isShowIndicator = true
            defer {
                isShowIndicator = false
            }
            do {
                eventApi = try await fetcher.fetchData()
            }
            catch {
                if let apiError = error as? ApiError {
                    self.error = apiError
                    isShowAlert = true
                } else {
                }
            }
        }
        
        
    }
}
