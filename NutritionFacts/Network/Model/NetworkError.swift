//
//  NetworkError.swift
//  NutritionFacts
//
//  Created by Ahmad Ragab on 20/11/2022.
//

import Foundation

/// Base struct for network error
struct NetworkError: Error {
    
    /// Not the default network error message, it is defined when using it
    let errorMsg: String
    
    /// Generic error message
    static let genericError = {
        NetworkError(errorMsg: ErrorType.genericError.rawValue)
    }
}

enum ErrorType: String {
    case genericError = "Something went wrong"
    case parsingFaild = "Failed in parsing data"
    case requestFailed = "Error processing request"
}
