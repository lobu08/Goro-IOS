//
//  ApiError.swift
//  Goro
//
//  Created by EG LONGBUI on 2024/08/06.
//

import Foundation

enum ApiError: Error {
    case invalidUrl
    
    case response
    
    case jsonDecode
    
    case statusCode(statusCode: String)
}

extension ApiError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return "Invalid URL"
        case .response:
            return "Reponse Error"
        case .jsonDecode:
            return "Json convert failed"
        case .statusCode(let statusCode):
            return "Error! StatusCode" + String(statusCode)
        }
    }
}
