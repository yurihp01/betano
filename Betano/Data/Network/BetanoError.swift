//
//  BetanoError.swift
//  Betano
//
//  Created by Yuri on 06/04/2022.
//

import Foundation

enum BetanoError: Error {
    case badURL
    case badResponse
    case invalidStatusCode(statusCode: Int)
    case invalidData
    case invalidJson
}

extension BetanoError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .badResponse:
            return "Invalid Response"
        case .badURL:
            return "Invalid URL"
        case .invalidData:
            return "Invalid Data"
        case .invalidJson:
            return "JSON decoding error"
        case .invalidStatusCode(let statusCode):
            return " Invalid status code: \(statusCode)"
        }
    }
}
