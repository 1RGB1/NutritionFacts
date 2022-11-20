//
//  FactsRouter.swift
//  NutritionFacts
//
//  Created by Ahmad Ragab on 20/11/2022.
//

import Foundation
import Alamofire

let FACTS_PATH = "foodipedia/codetest"

enum FactsRouter: ApiBaseRouter {
    case getFacts(Int)
}

extension FactsRouter {
    
    var path: String {
        return FACTS_PATH
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .getFacts(let id):
            return ["foodid" : id]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getFacts:
            return .get
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .getFacts:
            return nil
        }
    }
}

