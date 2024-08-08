//
//  ApiService.swift
//  Goro
//
//  Created by EG LONGBUI on 2024/08/07.
//

import Foundation


class ApiService {
    func request<T : Decodable>(from urlString: String, method: String = "Get", body: Data? = nil,  responseType: T.Type) async throws -> T {
        guard let url = URL( string: urlString) else {
            throw ApiError.invalidUrl
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.httpBody = body
        
        if body != nil {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpRespone = response as? HTTPURLResponse else {
            throw ApiError.response
        }
        
        switch httpRespone.statusCode {
        case 200:
            do {
                let searchedResultData = try JSONDecoder().decode(T.self, from: data)
                return searchedResultData
            } catch {
                throw ApiError.jsonDecode
            }
        default:
            throw ApiError.statusCode(statusCode: httpRespone.statusCode.description)
        }
        
    }
}

final class GetApiService: ApiService {
    private var getUrl = "http://127.0.0.1:8000/api/index"
    
    func fetchData() async throws -> [Api] {
        let apiGroup: ApiGroup = try await request(from: getUrl, method: "GET" ,responseType: ApiGroup.self)
        return apiGroup.apis
    }
}

